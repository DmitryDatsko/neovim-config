return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local line = require("lualine")

            local mode = {
                'mode',
                fmt = function(str)
                    return ' ' .. str
                end,
            }

            local filename = {
                "filename",
                file_status = true,
                path = 1,
            }

            local branch = {'branch', icon = {'', color={fg='#A6D4DE'}}, '|'}

            line.setup({
                options = {
                    theme = "everforest",
                },
                sections = {
                    lualine_a = { mode },
                    lualine_b = { branch },
                    lualine_c = { filename },
                    lualine_x = { "filetype" },
                    lualine_y = { "lsp_status" },
                    lualine_z = { "diagnostics" },
                },
            })
        end,
    },
}
