-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Only settings that DIFFER from LazyVim defaults are listed here.

-- Leader key (using LazyVim default: Space)
-- vim.g.mapleader = " "      -- Already set by LazyVim
-- vim.g.maplocalleader = "\\" -- Already set by LazyVim

-- Tabs/indentation (LazyVim uses 2, you use 4)
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- UI differences
vim.opt.scrolloff = 7       -- LazyVim: 4
vim.opt.laststatus = 2      -- LazyVim: 3 (global statusline)
vim.opt.wrap = true         -- LazyVim: false
vim.opt.ruler = true        -- LazyVim: false
vim.opt.cmdheight = 1       -- LazyVim: 0
vim.opt.foldcolumn = "1"    -- LazyVim: "0"

-- Your additions (not in LazyVim)
vim.opt.history = 500
vim.opt.wildignore:append({ "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" })
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.textwidth = 500
vim.opt.shortmess:append("A")  -- Stop 'Press ENTER' prompts

-- Disable auto-commenting on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Delete trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.txt", "*.js", "*.py", "*.sh", "*.lua" },
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- Fix capital letter typos for common commands
vim.api.nvim_create_user_command("W", "write", {})
vim.api.nvim_create_user_command("Wq", "wqa", {})
vim.api.nvim_create_user_command("WQ", "wqa", {})
vim.api.nvim_create_user_command("Q", "quit", {})
vim.api.nvim_create_user_command("Qa", "qa", {})
