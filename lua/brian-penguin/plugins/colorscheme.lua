return {
    "p00f/alabaster.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme alabaster")
        vim.cmd("highlight SignColumn guibg=black")
    end
}

