return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        event = { "BufReadPre", "BufNewFile" },
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup({
                install_dir = vim.fn.stdpath("data") .. "/site",
            })

            local ensure_installed = {
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
            }

            local installed = treesitter.get_installed and treesitter.get_installed() or {}
            local to_install = vim.tbl_filter(function(lang)
                return not vim.tbl_contains(installed, lang)
            end, ensure_installed)

            if #to_install > 0 then
                treesitter.install(to_install)
            end

            vim.api.nvim_create_autocmd("FileType", {
                pattern = ensure_installed,
                callback = function()
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,
    },
}
