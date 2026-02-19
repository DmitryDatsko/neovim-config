return {
    {
        "windwp/nvim-autopairs",
        enabled = true,
        lazy = true,
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
}
