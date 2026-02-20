return {
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        enabled = true,
        config = function()
            require("todo-comments").setup({})
        end,
    },
}
