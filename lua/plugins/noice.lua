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
                views = {
                    cmdline_popup = {
                        position = {
                            row = "50%",
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = "57%",
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                    },
                },
                routes = {
                    {
                        filter = {
                            event = "msg_show",
                            any = {
                                { find = "written" },
                            }
                        },
                        view = "notify",
                    },
                },
                presets = {
                    bottom_search = false,
                    command_palette = false,
                    long_message_to_split = true,
                },
            })

            require("notify").setup({
                timeout = 3000,
                max_width = 60,
                fps = 144,
                render = "minimal",
                stages = "static",
            })
        end,
    },
}
