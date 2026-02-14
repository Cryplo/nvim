-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Leader key (set before lazy.nvim loads)
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- General
vim.opt.history = 500
vim.opt.autoread = true

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 7 -- Keep 7 lines visible when scrolling
vim.opt.wildmenu = true
vim.opt.wildignore = { "*.o", "*~", "*.pyc", "*/.git/*", "*/.hg/*", "*/.svn/*", "*/.DS_Store" }
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.hidden = true
vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.whichwrap:append("<,>,h,l")
vim.opt.lazyredraw = true
vim.opt.magic = true
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.foldcolumn = "1"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- No annoying sounds
vim.opt.errorbells = false
vim.opt.visualbell = false

-- Colors
vim.opt.background = "dark"
vim.opt.termguicolors = true

-- Encoding
vim.opt.encoding = "utf-8"
vim.opt.fileformats = { "unix", "dos", "mac" }

-- Files, backups, undo
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

-- Tabs and indentation
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.textwidth = 500

-- Status line (LazyVim uses lualine, but ensure it's always visible)
vim.opt.laststatus = 2

-- Disable auto-commenting on new lines
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local line = vim.fn.line("'\"")
    if line > 1 and line <= vim.fn.line("$") then
      vim.cmd('normal! g\'"')
    end
  end,
})

-- Delete trailing whitespace on save for certain filetypes
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
vim.api.nvim_create_user_command("Wa", "wa", {})
vim.api.nvim_create_user_command("Q", "quit", {})
vim.api.nvim_create_user_command("Qa", "qa", {})

-- Stop the 'Press ENTER' prompt
vim.opt.shortmess:append("A")
