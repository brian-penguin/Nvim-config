-- It's git! In vim!
return {
    "tpope/vim-fugitive",
    lazy = false,
    keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Git buffer" } },
}
