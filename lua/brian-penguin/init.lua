-- Bootstrap lazy.nvim https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("brian-penguin.remap")
require("brian-penguin.set")

-- Load the plugins from the plugin/ dir
require("lazy").setup("brian-penguin.plugins")

require("brian-penguin.autocmd")

function R(name)
	require("plenary.reload").reload_module(name)
end

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

vim.lsp.enable("gleam")
