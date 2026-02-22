vim.o.cmdheight = 0
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
    },
})
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.cursorline = false
vim.opt.cursorcolumn = false
vim.opt.mouse = "n"
vim.opt.clipboard = "unnamedplus"
vim.opt.smartcase = true
vim.opt.textwidth = 120
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.linebreak = true
vim.opt.scrolloff = 10
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.backspace = { "start", "eol", "indent" }
-- vim.opt.completopt = "menuone,noselect"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.foldmethod = "syntax" -- manual, indent, expr(preffer), marker, diff
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("state") .. "/undo//"
vim.opt.formatoptions:remove("r")
vim.opt.formatoptions:remove("o")
vim.opt.isfname:append("@-@")

vim.g.netrw_banner = 0
vim.g.editorconfig = true
