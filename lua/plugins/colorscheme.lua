-- Dracula colorscheme (your preferred theme)
return {
  -- Add Dracula theme
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
  },

  -- Configure LazyVim to use Dracula
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
    },
  },
}
