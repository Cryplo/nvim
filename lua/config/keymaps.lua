-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set

-- Fast saving
map("n", "<leader>w", ":w!<CR>", { desc = "Save file" })

-- Smart way to move between windows (LazyVim uses these by default, but ensure they work)
map("n", "<C-j>", "<C-W>j", { desc = "Move to window below" })
map("n", "<C-k>", "<C-W>k", { desc = "Move to window above" })
map("n", "<C-h>", "<C-W>h", { desc = "Move to window left" })
map("n", "<C-l>", "<C-W>l", { desc = "Move to window right" })

-- Buffer navigation
map("n", "<leader>l", ":bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })
map("n", "<leader>ba", ":bufdo bd<CR>", { desc = "Delete all buffers" })

-- Tab management
map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>to", ":tabonly<CR>", { desc = "Close other tabs" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>t<leader>", ":tabnext<CR>", { desc = "Next tab" })

-- Disable highlight when <leader><cr> is pressed
map("n", "<leader><CR>", ":noh<CR>", { silent = true, desc = "Clear search highlight" })

-- Remap 0 to first non-blank character
map("n", "0", "^", { desc = "Go to first non-blank" })

-- Move lines with Alt+j/k
map("n", "<M-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<M-k>", ":m .-2<CR>==", { desc = "Move line up" })
map("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Spell checking
map("n", "<leader>ss", ":setlocal spell!<CR>", { desc = "Toggle spell check" })
map("n", "<leader>sn", "]s", { desc = "Next misspelled word" })
map("n", "<leader>sp", "[s", { desc = "Previous misspelled word" })
map("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
map("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })

-- Toggle paste mode
map("n", "<leader>pp", ":setlocal paste!<CR>", { desc = "Toggle paste mode" })

-- Quick open buffer for scribble
map("n", "<leader>q", ":e ~/buffer<CR>", { desc = "Open scratch buffer" })
map("n", "<leader>x", ":e ~/buffer.md<CR>", { desc = "Open markdown scratch" })

-- Terminal escape (important for terminal mode)
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Visual mode: search for selection with * or #
map("v", "*", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { desc = "Search selection forward" })
map("v", "#", [[y?\V<C-R>=escape(@",'/\')<CR><CR>]], { desc = "Search selection backward" })

-- Space to search (like your original config)
map("n", "<Space>", "/", { desc = "Search" })

-- Quick edit config
map("n", "<leader>e", ":e ~/.config/nvim/lua/config/options.lua<CR>", { desc = "Edit config" })

-- Git gutter toggle (if using gitsigns)
map("n", "<leader>d", ":Gitsigns toggle_signs<CR>", { desc = "Toggle git signs" })

-- Quickfix navigation
map("n", "<leader>cc", ":botright copen<CR>", { desc = "Open quickfix" })
map("n", "<leader>n", ":cn<CR>", { desc = "Next quickfix item" })
map("n", "<leader>p", ":cp<CR>", { desc = "Previous quickfix item" })
