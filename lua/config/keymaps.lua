-- local function format_and_save()
-- pcall(vim.lsp.buf.forma
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<ESC>", ":nohl<CR>", { desc = "clear search highlight", silent = true })

map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

map({ "n", "v" }, "<leader>/", "gcc", { desc = "toggle comment", remap = true })

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz", { desc = "moves down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "moves up in buffer with cursor centered" })

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>co", "<cmd>copen<CR>", { desc = "copen" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("x", "<leader>p", [["_dP]])
map("v", "p", '"_dP', opts)
map({ "n", "v" }, "<leader>d", [["_d]])

-- tabs
map("n", "<leader>b", "<cmd>tabnew<CR>", { desc = "buffer new" })
map("n", "<leader>x", "<cmd>tabclose<CR>", { desc = "close tab" })
map("n", "<tab>", "<cmd>tabn<CR>", { desc = "next tab" })
map("n", "<S-tab>", "<cmd>tabp<CR>", { desc = "prev tab" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Disable keyboard arrows
map({ "n", "i", "v", "x" }, "<Up>", "<Nop>", opts)
map({ "n", "i", "v", "x" }, "<Down>", "<Nop>", opts)
map({ "n", "i", "v", "x" }, "<Left>", "<Nop>", opts)
map({ "n", "i", "v", "x" }, "<Right>", "<Nop>", opts)

map("n", "<leader>cd", function()
    vim.cmd("w")
    vim.cmd("make")
end, { desc = "dotnet build in quickfix" })
