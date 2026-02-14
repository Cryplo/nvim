-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Only keymaps that DIFFER from or ADD to LazyVim defaults are listed here.

local map = vim.keymap.set

-- Fast saving (LazyVim doesn't have this)
map("n", "<leader>w", ":w!<CR>", { desc = "Save file" })

-- Buffer navigation (overrides LazyVim's <leader>l which opens Lazy manager)
map("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })

-- Clear search highlight (LazyVim uses <leader>ur)
map("n", "<leader><CR>", ":noh<CR>", { silent = true, desc = "Clear search highlight" })

-- Remap 0 to first non-blank character
map("n", "0", "^", { desc = "Go to first non-blank" })

-- Space to search (LazyVim uses Space as leader)
map("n", "<Space>", "/", { desc = "Search" })

-- Spell checking shortcuts
map("n", "<leader>ss", ":setlocal spell!<CR>", { desc = "Toggle spell check" })
map("n", "<leader>sn", "]s", { desc = "Next misspelled word" })
map("n", "<leader>sp", "[s", { desc = "Previous misspelled word" })
map("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
map("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })

-- Toggle paste mode
map("n", "<leader>pp", ":setlocal paste!<CR>", { desc = "Toggle paste mode" })

-- Quick scratch buffers
map("n", "<leader>q", ":e ~/buffer<CR>", { desc = "Open scratch buffer" })
map("n", "<leader>x", ":e ~/buffer.md<CR>", { desc = "Open markdown scratch" })

-- Terminal escape
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Visual mode: search for selection
map("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { desc = "Search selection forward" })
map("v", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR>]], { desc = "Search selection backward" })

-- Quick edit config
map("n", "<leader>e", ":e ~/.config/nvim/lua/config/options.lua<CR>", { desc = "Edit config" })

-- Quickfix navigation (your shortcuts)
map("n", "<leader>cc", ":botright copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>n", ":cn<CR>", { desc = "Next quickfix item" })
map("n", "<leader>p", ":cp<CR>", { desc = "Previous quickfix item" })
