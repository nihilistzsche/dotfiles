yay.create_autocmd("UpgradeSelect", {
	desc = "warn about recently modified AUR upgrades",
	callback = function(event)
		local recent_cutoff = os.time() - (3 * 24 * 60 * 60)
		for _, pkg in ipairs(event.data.upgrades) do
			if pkg.repository == "aur" and pkg.last_modified >= recent_cutoff then
				yay.log.warn("recently modified AUR package, pay attention to diff: ", pkg.name)
			end
		end

		return { exclude = {}, skip_menu = false }
	end,
})
