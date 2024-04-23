-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("v", "<C-c>", "<Esc>", { desc = "Exit visual mode" })

-- Tmux Navigation (tmux-navigation.lua)
vim.keymap.set("n", "<C-h>", require("nvim-tmux-navigation").NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", require("nvim-tmux-navigation").NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", require("nvim-tmux-navigation").NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", require("nvim-tmux-navigation").NvimTmuxNavigateRight)
vim.keymap.set("n", "<C-\\>", require("nvim-tmux-navigation").NvimTmuxNavigateLastActive)
