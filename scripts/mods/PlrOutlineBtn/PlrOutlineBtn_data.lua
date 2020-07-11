local mod = get_mod("PlrOutlineBtn")

-- Everything here is optional. You can remove unused parts.
return {
	name = "Player Outline Improvements",			-- Readable mod name
	description = mod:localize("mod_description"),  -- Mod description
	is_togglable = false,							-- If the mod can be enabled/disabled
	options = {                             		-- Widget settings for the mod options menu
		widgets = {
			{
				setting_id = "gr_toggle",
				type = "group",
				sub_widgets = {
					{
						setting_id = "outline_hold_hotkey",
						type = "keybind",
						keybind_global = false,
						keybind_type = "function_call",
						keybind_trigger = "held",
						function_name = "switch_outline_modes",
						default_value = {}
					},
					{
						setting_id = "outline_toggle_hotkey",
						type = "keybind",
						keybind_global = false,
						keybind_type = "function_call",
						keybind_trigger = "pressed",
						function_name = "switch_outline_modes",
						default_value = {}
					},
					{
						setting_id = "outline_mode_on",
						type = "dropdown",
						default_value = "always_on",
						options = {
							{text = "opt_off", value = "off"},
							{text = "opt_on", value = "on", show_widgets = {1}},
							{text = "opt_always_on", value = "always_on"}
						},
						sub_widgets = {
							{
								setting_id = "outline_range_on",
								tooltip = "outline_range_tooltip",
								type = "numeric",
								default_value = 40,
								range = {2, 250},
								decimals_number = 0
							}
						}
					},
					{
						setting_id = "outline_mode_off",
						type = "dropdown",
						default_value = "off",
						options = {
							{text = "opt_off", value = "off"},
							{text = "opt_on", value = "on", show_widgets = {1}},
							{text = "opt_always_on", value = "always_on"}
						},
						sub_widgets = {
							{
								setting_id = "outline_range_off",
								tooltip = "outline_range_tooltip",
								type = "numeric",
								default_value = 40,
								range = {2, 250},
								decimals_number = 0
							}
						}
					}
				}
			},
			{
				setting_id = "gr_clrs",
				type = "group",
				sub_widgets = {
					{
						setting_id = "gr_normal_clr",
						type = "group",
						sub_widgets = {
							{
								setting_id = "clr_al_r",
								type = "numeric",
								default_value = 118,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_al_g",
								type = "numeric",
								default_value = 186,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_al_b",
								type = "numeric",
								default_value = 0,
								range = {0, 255},
								decimals_number = 0
							}
						}
					},
					{
						setting_id = "gr_downed_clr",
						type = "group",
						sub_widgets = {
							{
								setting_id = "clr_kd_r",
								type = "numeric",
								default_value = 227,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_kd_g",
								type = "numeric",
								default_value = 4,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_kd_b",
								type = "numeric",
								default_value = 4,
								range = {0, 255},
								decimals_number = 0
							}
						}
					},
					{
						setting_id = "gr_interact_clr",
						type = "group",
						sub_widgets = {
							{
								setting_id = "clr_nc_r",
								type = "numeric",
								default_value = 255,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_nc_g",
								type = "numeric",
								default_value = 255,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_nc_b",
								type = "numeric",
								default_value = 255,
								range = {0, 255},
								decimals_number = 0
							}
						}
					},
					{
						setting_id = "gr_tag_clr",
						type = "group",
						sub_widgets = {
							{
								setting_id = "clr_tg_r",
								type = "numeric",
								default_value = 30,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_tg_g",
								type = "numeric",
								default_value = 150,
								range = {0, 255},
								decimals_number = 0
							},
							{
								setting_id = "clr_tg_b",
								type = "numeric",
								default_value = 255,
								range = {0, 255},
								decimals_number = 0
							}
						}
					}
				}
			}
		}
	}
}