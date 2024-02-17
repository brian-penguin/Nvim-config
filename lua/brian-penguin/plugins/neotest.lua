return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "olimorris/neotest-rspec"
        },
        status = { virtual_text = true },
        output = { open_on_run = true },
        quickfix = {
            open = function()
                require("trouble").open("quickfix")
            end,
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-rspec")({
                        rspec_cmd = "bin/rspec"
                    }),
                }
            })

            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        -- Replace newline and tab characters with space for more compact diagnostics
                        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
                        return message
                    end,
                },
            }, neotest_ns)

            neotest.summary = "botright vsplit | vertical resize 80"

            -- Key maps ----------------------------------------
            vim.keymap.set("n", "<leader>mts", function()
                neotest.run.run()
            end)

            -- TODO: should this also open the output panel or something?
            vim.keymap.set("n", "<leader>mtv", function()
                neotest.run.run(vim.fn.expand("%"))
                neotest.run.attach()
            end)

            vim.keymap.set("n", "<leader>to", function()
                neotest.output_panel.toggle()
            end)

            vim.keymap.set("n", "<leader>ts", function()
                neotest.summary.toggle()
            end)
        end,
    },
}
