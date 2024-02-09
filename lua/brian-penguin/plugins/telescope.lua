-- Telescope works as a tool for us to search through our project space
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {
            "<leader>ff",
            function() require("telescope.builtin").find_files() end,
            desc = "Find Files" 
        },
        {
            "<leader>pf",
            function() require("telescope.builtin").git_files() end,
            desc = "Find git Files" 
        },
        {
            "<leader>vh",
            function() require("telescope.builtin").help_tags() end,
            desc = "Help Tags" 
        },
        {
            "<leader>ps",
            function() require("telescope.builtin").grep_string({search = vim.fn.input("Grep > ")}) end,
            desc = "Project Search" 
        },
    }
}
