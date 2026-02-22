return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        lazy = false,
        enabled = true,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
                highlight = {
                    enabled = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                ensure_installed = {
                    "c_sharp",
                    "razor",
                    "lua",
                    "hyprlang",
                    "vim",
                    "vimdoc",
                    "rust",
                    "c",
                    "javascript",
                    "html",
                    "css",
                    "markdown",
                    "bash",
                    "json",
                },
                auto_install = true,
            })
        end,
    },
}
