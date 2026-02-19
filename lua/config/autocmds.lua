-- Highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        (vim.hl or vim.highlight).on_yank()
    end,
})
