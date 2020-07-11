return {
	run = function()
		fassert(rawget(_G, "new_mod"), "PlrOutlineBtn must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("PlrOutlineBtn", {
			mod_script       = "scripts/mods/PlrOutlineBtn/PlrOutlineBtn",
			mod_data         = "scripts/mods/PlrOutlineBtn/PlrOutlineBtn_data",
			mod_localization = "scripts/mods/PlrOutlineBtn/PlrOutlineBtn_localization"
		})
	end,
	packages = {
		"resource_packages/PlrOutlineBtn/PlrOutlineBtn"
	}
}
