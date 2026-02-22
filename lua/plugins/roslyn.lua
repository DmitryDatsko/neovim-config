return {
    {
        "seblyng/roslyn.nvim",
        config = function()
            require("roslyn").setup({})
        end,
        vim.lsp.config("roslyn", {})
    },
}
