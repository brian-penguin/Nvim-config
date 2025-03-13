return {
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "olimorris/neotest-rspec",
            "nvim-neotest/nvim-nio"
        },
        opts = {
            status = { virtual_text = true },
            output = { enabled = true, open_on_run = false },
            quickfix = {
                enabled = true,
                open = function()
                    vim.cmd("copen")
                    --TODO: Not sure why trouble doesn't want to work here?
                    --require("trouble").open({mode = "quickfix", focus= true})
                end
            },
        },
        config = function()
            local neotest = require("neotest")
            neotest.setup({
                adapters = {
                    require("neotest-rspec")({
                        rspec_cmd = function()
                            return vim.tbl_flatten({
                                "bundle",
                                "exec",
                                "rspec",
                                "--no-color", --no-color to avoid ascii escape color chars
                            })
                        end
                    }),
                },
                icons = {
                    child_indent = "│",
                    child_prefix = "├",
                    collapsed = "─",
                    expanded = "╮",
                    failed = "💩",
                    final_child_indent = " ",
                    final_child_prefix = "╰",
                    non_collapsible = "─",
                    notify = "",
                    passed = "😁",
                    running = "⏰",
                    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
                    skipped = "",
                    unknown = "",
                    watching = ""
                },
            })

            local neotest_ns = vim.api.nvim_create_namespace("neotest")
            vim.diagnostic.config({
                virtual_text = {
                    format = function(diagnostic)
                        -- Replace newline and tab characters with space for more compact diagnostics
                        local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+",
                            "")
                        return message
                    end,
                },
            }, neotest_ns)

            neotest.summary = "botright vsplit | vertical resize 80"

            -- Key maps ----------------------------------------
            -- TODO I want this to also support the desc, like we do in Telescope
            --      - Do we need to write this differently?
            vim.keymap.set("n", "<leader>mts", function()
                neotest.output_panel.clear()
                neotest.run.run()
            end)

            -- TODO: should this also open the output panel or something?
            vim.keymap.set("n", "<leader>mtv", function()
                neotest.output_panel.clear()
                neotest.run.run(vim.fn.expand("%"))
                neotest.run.attach()
            end)

            vim.keymap.set("n", "<leader>to", function()
                neotest.output.open({ enter = false, quiet = true, auto_close = true })
            end)

            vim.keymap.set("n", "<leader>tO", function()
                neotest.output_panel.toggle()
            end)
        end,
    },
}
