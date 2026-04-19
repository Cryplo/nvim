-- Dracula colorscheme (your preferred theme)
return {
  -- Add Dracula theme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_bg = true,
      lualine_bg_color = "NONE",
      overrides = {
        EndOfBuffer = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        FloatTitle = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        Pmenu = { bg = "NONE" },
        PmenuSbar = { bg = "NONE" },
        PmenuThumb = { bg = "NONE" },
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        StatusLineTerm = { bg = "NONE" },
        StatusLineTermNC = { bg = "NONE" },
        TabLineFill = { bg = "NONE" },
        WinSeparator = { bg = "NONE" },
        BufferLineBufferSelected = { bg = "NONE" },
        BufferLineFill = { bg = "NONE" },
        BufferLineSeparator = { bg = "NONE" },
      },
    },
  },

  -- Keep lualine aligned with Dracula's transparent background
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = "dracula-nvim"
    end,
  },

  -- Configure LazyVim to use Dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
