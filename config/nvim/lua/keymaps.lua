vim.g.mapleader = " "

local map = vim.keymap.set
map("n", "<leader>e",  ":NvimTreeToggle<CR>",      { desc = "file tree" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "buscar archivo" })
map("n", "<leader>fg", ":Telescope live_grep<CR>",  { desc = "buscar texto" })
map("n", "<leader>w",  ":w<CR>",                   { desc = "guardar" })
map("n", "<leader>q",  ":q<CR>",                   { desc = "cerrar" })
