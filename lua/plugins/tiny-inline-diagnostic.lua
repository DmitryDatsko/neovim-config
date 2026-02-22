return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "ghost",
                transparent_bg = true,
                options = {
                    multilines = { enabled = true, },
                    add_messages = {
                        messages = true,
                        display_count = true,
                    },
                    set_arrow_to_diag_color = true,
                    softwrap = 50,
                    enable_on_insert = true,
                    enable_on_select = true,
                    break_line = {
                        enabled = true,
                    },
                },
            })
            vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        end,
    },
}
