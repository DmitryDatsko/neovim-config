return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            {
                "mason-org/mason.nvim",
                opts = {
                    registries = {
                        "github:mason-org/mason-registry",
                        "github:Crashdummyy/mason-registry",
                    },
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗",
                        },
                    },
                },
            },
            "neovim/nvim-lspconfig",
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                opts = {
                    ensure_installed = {
                        "roslyn",
                        "csharpier",
                        "netcoredbg",
                    },
                },
            },
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                },
            })

            vim.keymap.set("n", "<leader>Mo", "<cmd>Mason<CR>", { desc = "open Mason graphical window" })
            vim.keymap.set("n", "<leader>Mu", "<cmd>Mason<CR>", { desc = "update all packages in Mason" })
        end,
    },
}
