return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        enabled = true,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup({
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
                },
                auto_install = true,
            })

            vim.api.nvim_create_autocmd('FileType', {
                pattern = '*',
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
