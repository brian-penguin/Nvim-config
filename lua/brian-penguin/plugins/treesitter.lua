return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "andymass/vim-matchup",
  },
  version = false,
  build = ":TSUpdate",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  init = function(plugin)
    -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
    -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
    -- no longer trigger the **nvim-treesitter** module to be loaded in time.
    -- Luckily, the only things that those plugins need are the custom queries, which we make available
    -- during startup.
    require("lazy.core.loader").add_to_rtp(plugin)
  end,
  opts_extended = { "ensure_installed" },
  opts = {
    indent = { enable = false }, -- This causes weird stuff to happen in ruby
    highlight = { enable = true },
    folds = { enable = true },
    ensure_installed = {
      "bash",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "ruby",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    matchup = true
  }
}
