-- It's git! In vim!
return {
    "tpope/vim-fugitive",
    lazy = true,
    keys = { { "<leader>gs", "<cmd>Git<cr>", desc = "Git buffer" } },
}
