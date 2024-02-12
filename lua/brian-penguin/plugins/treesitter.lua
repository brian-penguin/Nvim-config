return {
    -- add more treesitter parsers
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "clojure",
                "css",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "ruby",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    }, 

}
