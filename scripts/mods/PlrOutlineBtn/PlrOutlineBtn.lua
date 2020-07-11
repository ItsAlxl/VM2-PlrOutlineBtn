local mod = get_mod("PlrOutlineBtn")

mod:dofile("scripts/settings/outline_settings")

local outline_active = false

function mod.get_mode_and_range(on_or_off)
	local mode = mod["outline_mode_" .. on_or_off]
	local range = nil
	if mode == "on" then -- i.e. "on when obstructed"
		range = mod["outline_range_" .. on_or_off]
	end
	return mode, range
end

function mod.switch_outline_modes(active)
	local end_mode = nil
	local end_range = nil
	
	outline_active = not outline_active
	if outline_active then
		end_mode, end_range = mod.get_mode_and_range("on")
	else
		end_mode, end_range = mod.get_mode_and_range("off")
	end
	
	if end_mode then
		Application.set_user_setting("player_outlines", end_mode)
		if end_range then
			OutlineSettings.ranges.player_husk = end_range
			OutlineSettings.ranges.revive = end_range * 1.25
		end
		
		-- Apply new settings (from scripts/ui/views/options_view)
		local players = Managers.player:players()
		for _, player in pairs(players) do
			local player_unit = player.player_unit

			if not player.local_player and Unit.alive(player_unit) then
				local outline_extension = ScriptUnit.extension(player_unit, "outline_system")
				if end_range then
					outline_extension.set_distance("player_husk")
				end
				outline_extension.update_override_method_player_setting()
			end
		end
	end
end

function mod.change_outline_color(new_clr, clr_type)
	OutlineSettings.colors[clr_type].color = new_clr
end

mod.on_setting_changed = function(setting_name)
	if setting_name ~= "outline_hotkey" then
		if setting_name == "clr_al_r" or
		   setting_name == "clr_al_g" or
		   setting_name == "clr_al_b" then
			mod.change_outline_color({255, mod:get("clr_al_r"), mod:get("clr_al_g"), mod:get("clr_al_b")}, "ally")
		elseif setting_name == "clr_kd_r" or
		   setting_name == "clr_kd_g" or
		   setting_name == "clr_kd_b" then
			mod.change_outline_color({255, mod:get("clr_kd_r"), mod:get("clr_kd_g"), mod:get("clr_kd_b")}, "knocked_down")
		elseif setting_name == "clr_nc_r" or
		   setting_name == "clr_nc_g" or
		   setting_name == "clr_nc_b" then
			mod.change_outline_color({255, mod:get("clr_nc_r"), mod:get("clr_nc_g"), mod:get("clr_nc_b")}, "interactable")
		elseif setting_name == "clr_tg_r" or
		   setting_name == "clr_tg_g" or
		   setting_name == "clr_tg_b" then
			mod.change_outline_color({255, mod:get("clr_tg_r"), mod:get("clr_tg_g"), mod:get("clr_tg_b")}, "player_attention")
		else
			mod[setting_name] = mod:get(setting_name)
		end
	end
end

-- Force it to set defaults
mod.on_setting_changed("outline_toggle")
mod.on_setting_changed("outline_mode_on")
mod.on_setting_changed("outline_mode_off")
mod.on_setting_changed("clr_al_r")
mod.on_setting_changed("clr_kd_r")
mod.on_setting_changed("clr_nc_r")
mod.on_setting_changed("clr_tg_r")