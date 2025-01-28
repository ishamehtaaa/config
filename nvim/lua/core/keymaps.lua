local keymap = vim.keymap

-- Set leader key to space
vim.g.mapleader = " "

-- General keymaps
keymap.set("i", "jk", "<ESC>") -- Exit insert mode with jk
keymap.set("n", "<leader>nh", ":nohl<CR>") -- Clear search highlights
keymap.set("n", "x", '"_x') -- Delete single character without copying into register

-- Split window management
keymap.set("n", "<leader>sv", "<C-w>v") -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>h") -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- Close current split window

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- Go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- Go to previous tab

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {silent = true})
