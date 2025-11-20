return {
  --add catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
    },
  },

  --add onedarkpro
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    opts = {
      highlights = {
        Comment = { italic = true },
        -- NormalFloat = { bg = "NONE" },
        SnacksIndentScope = { fg = "#abb2bf" },
        CursorLineNr = { fg = "#abb2bf" },
      },
    },
  },

  --add kanagawa
  { "rebelot/kanagawa.nvim", name = "kanagawa" },

  --load colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
