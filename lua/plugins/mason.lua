return {
    {
        "mason-org/mason.nvim",
        enabled = false,
        config = function()
            require("mason").setup({})
        end,
    },
}

