return
{
    {
        "neanias/everforest-nvim",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("everforest").setup({
                background = "soft", -- "medium" / "soft" / "hard"
            })
            vim.cmd("colorscheme everforest")
            vim.api.nvim_set_hl(0, "@lsp.type.parameter", { fg = "#e69875" })
            vim.api.nvim_set_hl(0, "@lsp.type.parameter.cs", { link = "@lsp.type.parameter" })
        end,
    } }
