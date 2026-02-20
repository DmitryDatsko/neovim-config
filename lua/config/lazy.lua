local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

lazy.setup({
    spec ={
        { import = "plugins" },
    },
    checker = {
        enabled = true,
        notify = true 
    },
    change_detection = {
        notify = true
    },
})

vim.keymap.set("n", "<leader>Lh", function() lazy.home() end, { desc = "Lazy home" })
vim.keymap.set("n", "<leader>Li", function() lazy.install() end, { desc = "Lazy install"})
vim.keymap.set("n", "<leader>Ls", function() lazy.sync() end, { desc = "Lazy sync"})
vim.keymap.set("n", "<leader>Lr", function() lazy.reload() end, { desc = "Lazy reload"})
vim.keymap.set("n", "<leader>Lu", function() lazy.update() end, { desc = "Lazy update"})

