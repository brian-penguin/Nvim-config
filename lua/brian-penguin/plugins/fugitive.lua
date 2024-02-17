-- It's git! In vim!
return {
    "tpope/vim-fugitive",
    lazy = true,
    keys = { { "<leader>gg", "<cmd>Git<cr>", desc = "Git buffer" } },
}
