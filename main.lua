-- name: Machini Studio

TEX_HAND = get_texture_info("gd_texture_hand_open")
TEX_HAND_SELECT = get_texture_info("gd_texture_hand_closed")
m = gMarioStates[0]
oldMouseX = 0
events = {}
menu = MENU_TIMELINE
curTimelineFrame = 0
objs = {}
cd = 0
curEvent = -1
curEventOption = 1
dragEvent = false
playing = false

function ui_render()
	if camera_config_is_mouse_look_enabled() then camera_config_enable_mouse_look(false) end
	local mouse = get_mouse_data()
	local limitToScroll = 120
	djui_hud_set_resolution(RESOLUTION_N64)
	djui_hud_set_font(FONT_ALIASED)
	-- header
	djui_hud_set_color(0, 0, 0, 128)
	djui_hud_render_rect(0,0,djui_hud_get_screen_width(),16)
	djui_hud_set_color(0, 0, 0, 80)
	djui_hud_render_rect(0,16,djui_hud_get_screen_width(),2)
	djui_hud_set_color(255, 255, 255, 255)
	local text = "< " .. tabData[menu].name .. " >"
	djui_hud_print_outlined_text(text, (djui_hud_get_screen_width()-(djui_hud_measure_text(text)*0.5))/2, 0, 0.5, 0, 2)
	-- timeline menu
	if menu ~= MENU_TIMELINE then
		playing = false
	end
	if menu == MENU_TIMELINE then
		local height = 100
		local x, y = 0, djui_hud_get_screen_height()-height
		if djui_hud_mouse_overlaps_rect(0, 18, djui_hud_get_screen_width(), y-20) and mouse.justReleased then
			curEvent = -1
		end
		djui_hud_set_color(0, 0, 0, 128)
		djui_hud_render_rect(x,y,djui_hud_get_screen_width(),height)
		djui_hud_set_color(0, 0, 0, 80)
		djui_hud_render_rect(x,y-2,djui_hud_get_screen_width(),2)
		-- lines
		for i = 0, 9 do
			djui_hud_set_color(255, 255, 255, 255)
			local offset = (i*60) - math.max((curTimelineFrame-limitToScroll)*2, 0) % 60
			local num = i + math.floor(math.max((curTimelineFrame-limitToScroll)/30, 0))
			djui_hud_print_outlined_text(tostring(math.floor(num*30)), x+offset+2, y, 0.5, 0, 2)
			djui_hud_render_rect(x+offset,y,1,16)
		end
		-- sub lines
		for i = 0, 18 do
			djui_hud_set_color(255, 255, 255, 255)
			local offset = (i*30) - math.max((curTimelineFrame-limitToScroll)*2, 0) % 60
			local num = i + math.floor(math.max((curTimelineFrame-limitToScroll)/30, 0))
			djui_hud_render_rect(x+offset,y,1,8)
			if djui_hud_mouse_overlaps_rect(x+offset, y, 8, 16) and mouse.justReleased then
				playing = false
				curTimelineFrame = math.floor(num*15)
			end
		end
		-- line // cur time
		djui_hud_set_color(128, 255, 128, 255)
		djui_hud_render_rect(x+math.min(curTimelineFrame*2, limitToScroll*2),y,1,16)
		-- events
		local yPos = {}
		for i = 1, #events do
			if curEvent == i then
				if m.controller.buttonPressed & B_BUTTON ~= 0 then
					table.remove(events, i)
					break
				end
				djui_hud_set_color(255, 255, 255, 255)
			else
				djui_hud_set_color(255, 255, 255, 128)
			end
			local offset = (events[i].frame*2) - math.max((curTimelineFrame-limitToScroll)*2, 0)
			if yPos[events[i].frame] == nil then
				yPos[events[i].frame] = 1
			else
				yPos[events[i].frame] = yPos[events[i].frame] + 1
			end
			local bottomPos = yPos[events[i].frame]
			local iconX, iconY = x + offset, y + (16 * bottomPos)
			djui_hud_render_texture(eventData[events[i].type].icon or gTextures.star, iconX, iconY, 1, 1)
			if djui_hud_mouse_overlaps_rect(iconX, iconY, 16, 16) and mouse.justPressed then
				curEvent = i
				oldMouseX = mouse.x
				dragEvent = true
			end
			if dragEvent then
				if oldMouseX ~= mouse.x then
					local raw = (mouse.x - oldMouseX)
					events[curEvent].frame = events[curEvent].frame + math.floor(((raw*0.5) / 2)+0.5)*2
					oldMouseX = mouse.x
				end
				if mouse.justReleased then
					dragEvent = false
				end
			end
		end
		-- controls
		if cd < 0 then
			if m.controller.stickX > 32 then 
				playing = false
				curTimelineFrame = curTimelineFrame + 2
				cd = (m.controller.buttonDown & B_BUTTON) ~= 0 and 0 or 3
			end
			if m.controller.stickX < -32 then 
				playing = false
				curTimelineFrame = curTimelineFrame - 2
				cd = (m.controller.buttonDown & B_BUTTON) ~= 0 and 0 or 3
			end
		else
			cd = cd - 1
		end
		if (m.controller.buttonPressed & X_BUTTON) ~= 0 then
			table.insert(events, {
				frame = curTimelineFrame,
				type = EVENT_NONE,
				x = 0,
				y = 0,
				z = 0,
				pitch = 0,
				yaw = 0,
				roll = 0,
				eyes = MARIO_EYES_OPEN,
				hands = MARIO_HAND_FISTS,
				anim = 0x0E,
				duration = 30,
			})
		end
	-- event menu
	elseif menu == MENU_EVENT and curEvent ~= -1 then
		typeOption = {
			name = "Event Type",
			min = EVENT_NONE,
			max = EVENT_MOVE_CAMERA,
			get_real_value = function()
				return events[curEvent].type
			end,
			change_real_value = function(num, min, max)
				events[curEvent].type = events[curEvent].type + num
				if events[curEvent].type < min then
					events[curEvent].type = max
				end
				if events[curEvent].type > max then
					events[curEvent].type = min
				end
			end,
			get_value_display = function()
				return eventData[events[curEvent].type].name
			end,
		}
		local options = eventData[events[curEvent].type].options
		if options[1] == nil or options[1].name ~= "Event Type" then
			table.insert(options, 1, typeOption)
		end
		for i, option in pairs(options) do
			djui_hud_set_color(255, 255, 255, 255)
			local text = (curEventOption == i and "> " or "")..option.name..": "
			djui_hud_print_outlined_text(text, 5, 22+(18*i-1), 0.5, 0, 2)
			local text2 = (curEventOption == i and "< " or "")..option.get_value_display()..(curEventOption == i and "> " or "")
			local x = 10 + (djui_hud_measure_text(text)*0.5)
			djui_hud_set_color(0, 0, 0, 128)
			djui_hud_render_rect(x, 22+(18*i-1), (djui_hud_measure_text(text2)*0.5), 16)
			djui_hud_render_rect(x+2, 24+(18*i-1), (djui_hud_measure_text(text2)*0.5)-4, 12)
			djui_hud_set_color(255, 255, 255, 255)
			djui_hud_print_outlined_text(text2, x+((djui_hud_measure_text(text2)*0.5)-(djui_hud_measure_text(text2)*0.45))/2, 24+(18*i-1), 0.45, 0, 2)
			if curEventOption == i then
				if cd < 0 then
					if m.controller.stickX > 32 or djui_hud_get_raw_mouse_x() > 48 then 
						option.change_real_value(1, option.min, option.max)
						cd = option.hold and 0 or 5
					end
					if m.controller.stickX < -32 or djui_hud_get_raw_mouse_x() < -48 then 
						option.change_real_value(-1, option.min, option.max)
						cd = option.hold and 0 or 5
					end
				end
			end
			if djui_hud_mouse_overlaps_rect(5, 22+(18*i-1), (djui_hud_measure_text(text)*0.5), 16) then
				curEventOption = i
			end
		end
		if cd < 0 then
			if m.controller.stickY < -32 then 
				curEventOption = curEventOption + 1
				if curEventOption > #options then
					curEventOption = 1
				end
				cd = 5
			end
			if m.controller.stickY > 32 then 
				curEventOption = curEventOption - 1
				if curEventOption < 1 then
					curEventOption = #options
				end
				cd = 5
			end
		else
			cd = cd - 1
		end
	end
	if playing then
		curTimelineFrame = curTimelineFrame + 1
	end
	if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
		playing = not playing
	end
	-- tab controls
	if (m.controller.buttonPressed & L_JPAD) ~= 0 or (djui_hud_mouse_overlaps_rect(0,0,64,16) and mouse.justReleased) then
		menu = menu == 0 and MENU_MAX-1 or menu - 1
	end
	if (m.controller.buttonPressed & R_JPAD) ~= 0 or (djui_hud_mouse_overlaps_rect(djui_hud_get_screen_width()-64,0,64,16) and mouse.justReleased) then
		menu = menu == MENU_MAX-1 and 0 or menu + 1
	end
	-- misc
	m.freeze = 1
	djui_hud_set_color(255, 255, 255, 255)
	djui_hud_render_texture(mouse.pressed and TEX_HAND_SELECT or TEX_HAND, mouse.x-3, mouse.y-8, 0.75, 0.75)
end

hook_event(HOOK_ON_HUD_RENDER_BEHIND, ui_render)