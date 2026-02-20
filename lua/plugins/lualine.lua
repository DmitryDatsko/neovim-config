-- TODO asdasdasd
return {
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            local line = require("lualine")

            local filename = {
                "filename",
                file_status = true,
                path = 1,
            }

            line.setup({
                options = {
                    theme = "everforest",
                },
                sections = {
                    lualine_a = {"mode"},
                    lualine_b = { filename },
                    lualine_c = {"branch"},
                    lualine_x = {"fileformat"},
                    lualine_y = {"lsp_status"},
                    lualine_z = {"diagnostics"},
                },
            })
        end,
    },
}
