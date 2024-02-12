return  {
    {
        -- Mason is used for installing stuff like LSPs, Formatters, Debugging servers
        -- linters. We are going to use it to install our LSP
        -- see h: mason-how-to-use-packages or h: mason-introduction
        -- (I think this should "just work" with the lspconfig setup to install 
        -- the language servers we want)
        "williamboman/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = opts.ensure_installed or {}
            table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
    },
    -- Install our lsps with mason (automagically)
    "williamboman/mason-lspconfig.nvim",
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "folke/neodev.nvim", opts = {} },
            "mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
    },

}
