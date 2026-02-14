-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Only settings that DIFFER from LazyVim defaults are listed here.

-- Leader key (using LazyVim default: Space)
-- vim.g.mapleader = " "      -- Already set by LazyVim
-- vim.g.maplocalleader = "\\" -- Already set by LazyVim

-- Disable auto-format on save (use <leader>cf to format manually)
vim.g.autoformat = false

-- UI differences
vim.opt.cursorline = false -- LazyVim: true
vim.opt.scrolloff = 7 -- LazyVim: 4
vim.opt.laststatus = 2 -- LazyVim: 3 (global statusline)
vim.opt.ruler = true -- LazyVim: false

-- Your additions (not in LazyVim)
vim.opt.history = 500
vim.opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" })
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.textwidth = 500
vim.opt.shortmess:append("A") -- Stop 'Press ENTER' prompts

-- Disable auto-commenting on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})


-- Fix capital letter typos for common commands
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Wq", "wqa", {})
vim.api.nvim_create_user_command("WQ", "wqa", {})
vim.api.nvim_create_user_command("Q", "quit", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
