return {
    {
        "folke/noice.nvim",
        lazy = false,
        priority = 800,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                cmdline = {
                    enabled = true,
                    view = "cmdline_popup",
                },
                messages = { enabled = true },
                lsp = {
                    override = {
                        ["vim.lsp.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                    },
                },
                notify = {
                    enabled = true,
                    view = "notify",
                },
            })

            require("notify").setup({
                timeout = 3000,
                max_width = 60,
                fps = 144,
                render = "compact",
                stages = "static",
            })
        end,
    },
}
