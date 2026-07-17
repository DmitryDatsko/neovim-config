return {
    {
        'stevearc/aerial.nvim',
        opts = {
            nav = {
                preview = true,
            },
            layout = {
                default_direction = "left",
            },
            on_attach = function(bufnr)
                vim.keymap.set("n", "[[", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                vim.keymap.set("n", "]]", "<cmd>AerialNext<CR>", { buffer = bufnr })
            end,
        },
        keys = {
            { "<leader>a", "<cmd>AerialToggle<CR>", desc = "Toggle outline window" },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
    }
}
