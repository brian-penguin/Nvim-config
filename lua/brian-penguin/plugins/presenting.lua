return {
  "sotte/presenting.nvim",
  opts = {
    -- fill in your options here
    -- see :help Presenting.config
  },
  cmd = { "Presenting" },
}

-- Default values:
-- >lua
--   Presenting.config = {
--     options = {
--       -- The width of the slide buffer.
--       width = 60,
--     },
--     separator = {
--       -- Separators for different filetypes.
--       -- You can add your own or oberwrite existing ones.
--       -- Note: separators are lua patterns, not regexes.
--       markdown = "^#+ ",
--       org = "^*+ ",
--       adoc = "^==+ ",
--       asciidoctor = "^==+ ",
--     },
--     -- Keep the separator, useful if you're parsing based on headings.
--     -- If you want to parse on a non-heading separator, e.g. `---` set this to false.
--     keep_separator = true,
--     keymaps = {
--       -- These are local mappings for the open slide buffer.
--       -- Disable existing keymaps by setting them to `nil`.
--       -- Add your own keymaps as you desire.
--       ["n"] = function() Presenting.next() end,
--       ["p"] = function() Presenting.prev() end,
--       ["q"] = function() Presenting.quit() end,
--       ["f"] = function() Presenting.first() end,
--       ["l"] = function() Presenting.last() end,
--       ["<CR>"] = function() Presenting.next() end,
--       ["<BS>"] = function() Presenting.prev() end,
--     },
--     -- A function that configures the slide buffer.
--     -- If you want custom settings write your own function that accepts a buffer id as argument.
--     configure_slide_buffer = function(buf) H.configure_slide_buffer(buf) end,
--   }
-- <
