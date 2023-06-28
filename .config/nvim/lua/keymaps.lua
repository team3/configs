-- set leader key to space
vim.g.mapleader = " "

-- General Keymaps
---------------------
local keymap = vim.keymap -- for conciseness
---------------------
keymap.set("n", "<S-Up>", "<Esc>:m .-2<CR>==")
keymap.set("n", "<S-Down>", "<Esc>:m .+1<CR>==")
-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window
