local HEX_DIGITS = "0123456789ABCDEF"

function dec_to_hex(num)
    if num == 0 then return "0" end
    local result = ""
    while num > 0 do
        local n = num % 16
        result = string.sub(HEX_DIGITS, n + 1, n + 1) .. result
        num = math.floor(num / 16)
    end
    return "0x"..(#result < 2 and "0"..result or result)
end

function get_mouse_data()
	local t = {
		x = djui_hud_get_mouse_x()/3,
		y = djui_hud_get_mouse_y()/3,
		pressed = djui_hud_get_mouse_buttons_down() ~= 0,
		justPressed = djui_hud_get_mouse_buttons_pressed() ~= 0,
		justReleased = djui_hud_get_mouse_buttons_released() ~= 0,
	}
	return t
end

function djui_hud_mouse_overlaps_rect(x, y, w, h)
	local mouse = get_mouse_data()
	if mouse.x >= x and mouse.x < (x + w) and mouse.y >= y and mouse.y < (y + h) then
		return true
	end
	return false
end

function djui_hud_print_outlined_text(text, x, y, scale, outlineDarkness, borderScale)
    local offset = borderScale * scale
    local color = djui_hud_get_color()
    -- render outline
    djui_hud_set_color(color.r * outlineDarkness, color.g * outlineDarkness, color.b * outlineDarkness, color.a)
    djui_hud_print_text(text, x - offset, y,          scale)
    djui_hud_print_text(text, x + offset, y,          scale)
    djui_hud_print_text(text, x,          y - offset, scale)
    djui_hud_print_text(text, x,          y + offset, scale)
    -- render text
    djui_hud_set_color(color.r, color.g, color.b, color.a)
    djui_hud_print_text(text, x, y, scale)
end