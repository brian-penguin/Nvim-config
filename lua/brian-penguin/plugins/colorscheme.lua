return {
    "brian-penguin/alabaster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme alabaster")
        vim.cmd("highlight SignColumn guibg=black")
    end
}
--return {
--    "rose-pine/neovim",
--    lazy = false,
--    priority = 1000,
--    config = function ()
--        vim.cmd("colorscheme rose-pine-dawn")
--        vim.cmd("highlight SignColumn guibg=black")
--    end
--}
