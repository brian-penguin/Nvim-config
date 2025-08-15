local highlight = {
  "CursorColumn",
  "Whitespace",
}

return {
  -- Show indentation guides
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    scope = {
      enabled = false,
    },
    indent = { highlight = highlight, char = "" },
    whitespace = {
      highlight = highlight,
      remove_blankline_trail = false,
    }
  },
}
