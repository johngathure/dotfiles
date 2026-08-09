-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "gathure.plugins" }, { import = "gathure.plugins.lsp" } }, {
	install = { colorscheme = { "tokyonight-storm" } },
	checker = {
		enabled = true,
		notify = false,
		-- the checker git-fetches every plugin; hourly (the default) meant that
		-- ran on practically every startup
		frequency = 60 * 60 * 24 * 7,
	},
	change_detection = {
		notify = false,
	},
	performance = {
		rtp = {
			-- both are superseded by vim-matchup, which also wants matchparen off
			-- so the two do not each highlight the same match. Disabling the other
			-- built-ins measured at well under 1ms combined, and would cost the
			-- ability to open .gz/.tar/.zip files in place.
			disabled_plugins = { "matchit", "matchparen" },
		},
	},
})
