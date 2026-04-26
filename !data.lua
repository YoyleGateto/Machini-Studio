EVENT_NONE = 0
EVENT_MARIO_MOVE = 1
EVENT_MARIO_SET_ANIM = 2
EVENT_MOVE_CAMERA = 3

animNames = {
    [0x00] = 'SLOW_LEDGE_GRAB',
    [0x01] = 'FALL_OVER_BACKWARDS',
    [0x02] = 'BACKWARD_AIR_KB',
    [0x03] = 'DYING_ON_BACK',
    [0x04] = 'BACKFLIP',
    [0x05] = 'CLIMB_UP_POLE',
    [0x06] = 'GRAB_POLE_SHORT',
    [0x07] = 'GRAB_POLE_SWING_PART1',
    [0x08] = 'GRAB_POLE_SWING_PART2',
    [0x09] = 'HANDSTAND_IDLE',
    [0x0A] = 'HANDSTAND_JUMP',
    [0x0B] = 'START_HANDSTAND',
    [0x0C] = 'RETURN_FROM_HANDSTAND',
    [0x0D] = 'IDLE_ON_POLE',
    [0x0E] = 'A_POSE',
    [0x0F] = 'SKID_ON_GROUND',
    [0x10] = 'STOP_SKID',
    [0x11] = 'CROUCH_FROM_FAST_LONGJUMP',
    [0x12] = 'CROUCH_FROM_SLOW_LONGJUMP',
    [0x13] = 'FAST_LONGJUMP',
    [0x14] = 'SLOW_LONGJUMP',
    [0x15] = 'AIRBORNE_ON_STOMACH',
    [0x16] = 'WALK_WITH_LIGHT_OBJ',
    [0x17] = 'RUN_WITH_LIGHT_OBJ',
    [0x18] = 'SLOW_WALK_WITH_LIGHT_OBJ',
    [0x19] = 'SHIVERING_WARMING_HAND',
    [0x1A] = 'SHIVERING_RETURN_TO_IDLE',
    [0x1B] = 'SHIVERING',
    [0x1C] = 'CLIMB_DOWN_LEDGE',
    [0x1D] = 'CREDITS_WAVING',
    [0x1E] = 'CREDITS_LOOK_UP',
    [0x1F] = 'CREDITS_RETURN_FROM_LOOK_UP',
    [0x20] = 'CREDITS_RAISE_HAND',
    [0x21] = 'CREDITS_LOWER_HAND',
    [0x22] = 'CREDITS_TAKE_OFF_CAP',
    [0x23] = 'CREDITS_START_WALK_LOOK_UP',
    [0x24] = 'CREDITS_LOOK_BACK_THEN_RUN',
    [0x25] = 'FINAL_BOWSER_RAISE_HAND_SPIN',
    [0x26] = 'FINAL_BOWSER_WING_CAP_TAKE_OFF',
    [0x27] = 'CREDITS_PEACE_SIGN',
    [0x28] = 'STAND_UP_FROM_LAVA_BOOST',
    [0x29] = 'FIRE_LAVA_BURN',
    [0x2A] = 'WING_CAP_FLY',
    [0x2B] = 'HANG_ON_OWL',
    [0x2C] = 'LAND_ON_STOMACH',
    [0x2D] = 'AIR_FORWARD_KB',
    [0x2E] = 'DYING_ON_STOMACH',
    [0x2F] = 'SUFFOCATING',
    [0x30] = 'COUGHING',
    [0x31] = 'THROW_CATCH_KEY',
    [0x32] = 'DYING_FALL_OVER',
    [0x33] = 'IDLE_ON_LEDGE',
    [0x34] = 'FAST_LEDGE_GRAB',
    [0x35] = 'HANG_ON_CEILING',
    [0x36] = 'PUT_CAP_ON',
    [0x37] = 'TAKE_CAP_OFF_THEN_ON',
    [0x38] = 'QUICKLY_PUT_CAP_ON',
    [0x39] = 'HEAD_STUCK_IN_GROUND',
    [0x3A] = 'GROUND_POUND_LANDING',
    [0x3B] = 'TRIPLE_JUMP_GROUND_POUND',
    [0x3C] = 'START_GROUND_POUND',
    [0x3D] = 'GROUND_POUND',
    [0x3E] = 'BOTTOM_STUCK_IN_GROUND',
    [0x3F] = 'IDLE_WITH_LIGHT_OBJ',
    [0x40] = 'JUMP_LAND_WITH_LIGHT_OBJ',
    [0x41] = 'JUMP_WITH_LIGHT_OBJ',
    [0x42] = 'FALL_LAND_WITH_LIGHT_OBJ',
    [0x43] = 'FALL_WITH_LIGHT_OBJ',
    [0x44] = 'FALL_FROM_SLIDING_WITH_LIGHT_OBJ',
    [0x45] = 'SLIDING_ON_BOTTOM_WITH_LIGHT_OBJ',
    [0x46] = 'STAND_UP_FROM_SLIDING_WITH_LIGHT_OBJ',
    [0x47] = 'RIDING_SHELL',
    [0x48] = 'WALKING',
    [0x49] = 'FORWARD_FLIP',
    [0x4A] = 'JUMP_RIDING_SHELL',
    [0x4B] = 'LAND_FROM_DOUBLE_JUMP',
    [0x4C] = 'DOUBLE_JUMP_FALL',
    [0x4D] = 'SINGLE_JUMP',
    [0x4E] = 'LAND_FROM_SINGLE_JUMP',
    [0x4F] = 'AIR_KICK',
    [0x50] = 'DOUBLE_JUMP_RISE',
    [0x51] = 'START_FORWARD_SPINNING',
    [0x52] = 'THROW_LIGHT_OBJECT',
    [0x53] = 'FALL_FROM_SLIDE_KICK',
    [0x54] = 'BEND_KNESS_RIDING_SHELL',
    [0x55] = 'LEGS_STUCK_IN_GROUND',
    [0x56] = 'GENERAL_FALL',
    [0x57] = 'GENERAL_LAND',
    [0x58] = 'BEING_GRABBED',
    [0x59] = 'GRAB_HEAVY_OBJECT',
    [0x5A] = 'SLOW_LAND_FROM_DIVE',
    [0x5B] = 'FLY_FROM_CANNON',
    [0x5C] = 'MOVE_ON_WIRE_NET_RIGHT',
    [0x5D] = 'MOVE_ON_WIRE_NET_LEFT',
    [0x5E] = 'MISSING_CAP',
    [0x5F] = 'PULL_DOOR_WALK_IN',
    [0x60] = 'PUSH_DOOR_WALK_IN',
    [0x61] = 'UNLOCK_DOOR',
    [0x62] = 'START_REACH_POCKET',
    [0x63] = 'REACH_POCKET',
    [0x64] = 'STOP_REACH_POCKET',
    [0x65] = 'GROUND_THROW',
    [0x66] = 'GROUND_KICK',
    [0x67] = 'FIRST_PUNCH',
    [0x68] = 'SECOND_PUNCH',
    [0x69] = 'FIRST_PUNCH_FAST',
    [0x6A] = 'SECOND_PUNCH_FAST',
    [0x6B] = 'PICK_UP_LIGHT_OBJ',
    [0x6C] = 'PUSHING',
    [0x6D] = 'START_RIDING_SHELL',
    [0x6E] = 'PLACE_LIGHT_OBJ',
    [0x6F] = 'FORWARD_SPINNING',
    [0x70] = 'BACKWARD_SPINNING',
    [0x71] = 'BREAKDANCE',
    [0x72] = 'RUNNING',
    [0x73] = 'RUNNING_UNUSED',
    [0x74] = 'SOFT_BACK_KB',
    [0x75] = 'SOFT_FRONT_KB',
    [0x76] = 'DYING_IN_QUICKSAND',
    [0x77] = 'IDLE_IN_QUICKSAND',
    [0x78] = 'MOVE_IN_QUICKSAND',
    [0x79] = 'ELECTROCUTION',
    [0x7A] = 'SHOCKED',
    [0x7B] = 'BACKWARD_KB',
    [0x7C] = 'FORWARD_KB',
    [0x7D] = 'IDLE_HEAVY_OBJ',
    [0x7E] = 'STAND_AGAINST_WALL',
    [0x7F] = 'SIDESTEP_LEFT',
    [0x80] = 'SIDESTEP_RIGHT',
    [0x81] = 'START_SLEEP_IDLE',
    [0x82] = 'START_SLEEP_SCRATCH',
    [0x83] = 'START_SLEEP_YAWN',
    [0x84] = 'START_SLEEP_SITTING',
    [0x85] = 'SLEEP_IDLE',
    [0x86] = 'SLEEP_START_LYING',
    [0x87] = 'SLEEP_LYING',
    [0x88] = 'DIVE',
    [0x89] = 'SLIDE_DIVE',
    [0x8A] = 'GROUND_BONK',
    [0x8B] = 'STOP_SLIDE_LIGHT_OBJ',
    [0x8C] = 'SLIDE_KICK',
    [0x8D] = 'CROUCH_FROM_SLIDE_KICK',
    [0x8E] = 'SLIDE_MOTIONLESS',
    [0x8F] = 'STOP_SLIDE',
    [0x90] = 'FALL_FROM_SLIDE',
    [0x91] = 'SLIDE',
    [0x92] = 'TIPTOE',
    [0x93] = 'TWIRL_LAND',
    [0x94] = 'TWIRL',
    [0x95] = 'START_TWIRL',
    [0x96] = 'STOP_CROUCHING',
    [0x97] = 'START_CROUCHING',
    [0x98] = 'CROUCHING',
    [0x99] = 'CRAWLING',
    [0x9A] = 'STOP_CRAWLING',
    [0x9B] = 'START_CRAWLING',
    [0x9C] = 'SUMMON_STAR',
    [0x9D] = 'RETURN_STAR_APPROACH_DOOR',
    [0x9E] = 'BACKWARDS_WATER_KB',
    [0x9F] = 'SWIM_WITH_OBJ_PART1',
    [0xA0] = 'SWIM_WITH_OBJ_PART2',
    [0xA1] = 'FLUTTERKICK_WITH_OBJ',
    [0xA2] = 'WATER_ACTION_END_WITH_OBJ',
    [0xA3] = 'STOP_GRAB_OBJ_WATER',
    [0xA4] = 'WATER_IDLE_WITH_OBJ',
    [0xA5] = 'DROWNING_PART1',
    [0xA6] = 'DROWNING_PART2',
    [0xA7] = 'WATER_DYING',
    [0xA8] = 'WATER_FORWARD_KB',
    [0xA9] = 'FALL_FROM_WATER',
    [0xAA] = 'SWIM_PART1',
    [0xAB] = 'SWIM_PART2',
    [0xAC] = 'FLUTTERKICK',
    [0xAD] = 'WATER_ACTION_END',
    [0xAE] = 'WATER_PICK_UP_OBJ',
    [0xAF] = 'WATER_GRAB_OBJ_PART2',
    [0xB0] = 'WATER_GRAB_OBJ_PART1',
    [0xB1] = 'WATER_THROW_OBJ',
    [0xB2] = 'WATER_IDLE',
    [0xB3] = 'WATER_STAR_DANCE',
    [0xB4] = 'RETURN_FROM_WATER_STAR_DANCE',
    [0xB5] = 'GRAB_BOWSER',
    [0xB6] = 'SWINGING_BOWSER',
    [0xB7] = 'RELEASE_BOWSER',
    [0xB8] = 'HOLDING_BOWSER',
    [0xB9] = 'HEAVY_THROW',
    [0xBA] = 'WALK_PANTING',
    [0xBB] = 'WALK_WITH_HEAVY_OBJ',
    [0xBC] = 'TURNING_PART1',
    [0xBD] = 'TURNING_PART2',
    [0xBE] = 'SLIDEFLIP_LAND',
    [0XBF] = 'SLIDEFLIP',
    [0xC0] = 'TRIPLE_JUMP_LAND',
    [0xC1] = 'TRIPLE_JUMP',
    [0xC2] = 'FIRST_PERSON',
    [0xC3] = 'IDLE_HEAD_LEFT',
    [0xC4] = 'IDLE_HEAD_RIGHT',
    [0xC5] = 'IDLE_HEAD_CENTER',
    [0xC6] = 'HANDSTAND_LEFT',
    [0xC7] = 'HANDSTAND_RIGHT',
    [0xC8] = 'WAKE_FROM_SLEEP',
    [0xC9] = 'WAKE_FROM_LYING',
    [0xCA] = 'START_TIPTOE',
    [0xCB] = 'SLIDEJUMP',
    [0xCC] = 'START_WALLKICK',
    [0xCD] = 'STAR_DANCE',
    [0xCE] = 'RETURN_FROM_STAR_DANCE',
    [0xCF] = 'FORWARD_SPINNING_FLIP',
    [0xD0] = 'TRIPLE_JUMP_FLY',
}

handNames = {
    [MARIO_HAND_FISTS] = "Fists",
    [MARIO_HAND_OPEN] = "Open",
    [MARIO_HAND_PEACE_SIGN] = "Peace",
    [MARIO_HAND_HOLDING_CAP] = "Cap",
    [MARIO_HAND_HOLDING_WING_CAP] = "Wing Cap",
    [MARIO_HAND_RIGHT_OPEN] = "Right Open",
}

eyeNames = {
    [MARIO_EYES_OPEN] = "Open",
    [MARIO_EYES_HALF_CLOSED] = "Half",
    [MARIO_EYES_CLOSED] = "Closed",
    [MARIO_EYES_LOOK_LEFT] = "Left",
    [MARIO_EYES_LOOK_RIGHT] = "Right",
    [MARIO_EYES_LOOK_UP] = "Up",
    [MARIO_EYES_LOOK_DOWN] = "Down",
    [MARIO_EYES_DEAD] = "Dead",
}

MENU_TIMELINE = 0
MENU_EVENT = 1
MENU_OBJS = 2
MENU_MAX = 3

tabData = {
	[MENU_TIMELINE] = {
		name = "Timeline",
	},
	[MENU_EVENT] = {
		name = "Event",
	},
	[MENU_OBJS] = {
		name = "Objects",
	},
}

eventData = {
	[EVENT_NONE] = {
		name = "None",
		options = {}
	},
	[EVENT_MARIO_MOVE] = {
		name = "Move Mario",
		icon = gTextures.mario_head,
		options = {
			{
				name = "X",
				min = "inf",
				max = "inf",
				hold = true,
				get_real_value = function()
					return events[curEvent].x
				end,
				change_real_value = function(num, min, max)
					events[curEvent].x = events[curEvent].x + num
					if min ~= "inf" and events[curEvent].x < min then
						events[curEvent].x = max
					elseif max ~= "inf" and events[curEvent].x > max then
						events[curEvent].x = min
					end
				end,
				get_value_display = function()
					return tostring(events[curEvent].x)
				end,
			},
			{
				name = "Y",
				min = "inf",
				max = "inf",
				hold = true,
				get_real_value = function()
					return events[curEvent].y
				end,
				change_real_value = function(num, min, max)
					events[curEvent].y = events[curEvent].y + num
					if min ~= "inf" and events[curEvent].y < min then
						events[curEvent].y = max
					elseif max ~= "inf" and events[curEvent].y > max then
						events[curEvent].y = min
					end
				end,
				get_value_display = function()
					return tostring(events[curEvent].y)
				end,
			},
			{
				name = "Z",
				min = "inf",
				max = "inf",
				hold = true,
				get_real_value = function()
					return events[curEvent].z
				end,
				change_real_value = function(num, min, max)
					events[curEvent].z = events[curEvent].z + num
					if min ~= "inf" and events[curEvent].z < min then
						events[curEvent].z = max
					elseif max ~= "inf" and events[curEvent].y > max then
						events[curEvent].z = min
					end
				end,
				get_value_display = function()
					return tostring(events[curEvent].z)
				end,
			},
			{
				name = "Direction",
				min = -360,
				max = 360,
				hold = true,
				get_real_value = function()
					return events[curEvent].yaw
				end,
				change_real_value = function(num, min, max)
					events[curEvent].yaw = events[curEvent].yaw + num
					if min ~= "inf" and events[curEvent].yaw < min then
						events[curEvent].yaw = max
					elseif max ~= "inf" and events[curEvent].yaw > max then
						events[curEvent].yaw = min
					end
				end,
				get_value_display = function()
					return tostring(events[curEvent].yaw).."d"
				end,
			},
		}
	},
	[EVENT_MARIO_SET_ANIM] = {
		name = "Set Mario Animation",
		icon = gTextures.mario_head,
		options = {
			{
				name = "Animation",
				min = 0x00,
				max = 0xD0,
				get_real_value = function()
					return events[curEvent].anim
				end,
				change_real_value = function(num, min, max)
					events[curEvent].anim = events[curEvent].anim + num
					if min ~= "inf" and events[curEvent].anim < min then
						events[curEvent].anim = max
					elseif max ~= "inf" and events[curEvent].anim > max then
						events[curEvent].anim = min
					end
				end,
				get_value_display = function()
					return dec_to_hex(events[curEvent].anim) .. " - " .. animNames[events[curEvent].anim]
				end,
			},
			{
				name = "Eye Type",
				min = MARIO_EYES_OPEN,
				max = MARIO_EYES_DEAD,
				get_real_value = function()
					return events[curEvent].eyes
				end,
				change_real_value = function(num, min, max)
					events[curEvent].eyes = events[curEvent].eyes + num
					if min ~= "inf" and events[curEvent].eyes < min then
						events[curEvent].eyes = max
					elseif max ~= "inf" and events[curEvent].y > max then
						events[curEvent].eyes = min
					end
				end,
				get_value_display = function()
					return eyeNames[events[curEvent].eyes]
				end,
			},
			{
				name = "Hand Type",
				min = MARIO_HAND_FISTS,
				max = MARIO_HAND_RIGHT_OPEN,
				get_real_value = function()
					return events[curEvent].hands
				end,
				change_real_value = function(num, min, max)
					events[curEvent].hands = events[curEvent].hands + num
					if min ~= "inf" and events[curEvent].hands < min then
						events[curEvent].hands = max
					elseif max ~= "inf" and events[curEvent].y > max then
						events[curEvent].hands = min
					end
				end,
				get_value_display = function()
					return handNames[events[curEvent].hands]
				end,
			}
		}
	},
	[EVENT_MOVE_CAMERA] = {
		name = "Move Camera",
		icon = gTextures.camera,
		options = {}
	},
}