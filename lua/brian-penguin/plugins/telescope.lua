-- Telescope works as a tool for us to search through our project space
return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        -- or
        -- , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            {
                "<leader>ff",
                function()
                    require("telescope.builtin").find_files({
                        previewer = false,
                        shorten_path = true,
                        layout_strategy = "horizontal"
                    })
                end,
                desc = "Find Files"
            },
            {
                "<leader>pf",
                function()
                    require("telescope.builtin").git_files({
                        previewer = false,
                        shorten_path = true,
                        layout_strategy = "horizontal"
                    })
                end,
                desc = "Find git Files"
            },
            {
                "<leader>vh",
                function() require("telescope.builtin").help_tags() end,
                desc = "Help Tags"
            },
            {
                "<leader>sp",
                function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end,
                desc = "SearchProject"
            },
        },
    },
    -- add telescope-fzf-native so we can use the fzf fuzzy matching
    -- (EX, typing "model patient" should return "packs/.../model/whatever/patient.rb")
    {
        "telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    },
}
