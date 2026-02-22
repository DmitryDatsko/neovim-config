return {
    {
        "nvim-neotest/neotest",
        commit = "52fca6717ef972113ddd6ca223e30ad0abb2800c",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "Issafalcon/neotest-dotnet",
        },
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-dotnet")({
                        dap = { justMyCode = false },
                    }),
                },
            })
        end,
    },
}
