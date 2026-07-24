return {
    {
        "bassamsdata/namu.nvim",
        opts = {
            namu_symbols = {
                enable = true,
                options = {
                    display = {
                        format = "tree_guides",
                        mode = "icon",
                        padding = 2,
                    },
                    AllowKinds = {
                        default = {
                            "Function",
                            "Method",
                            "Class",
                            "Module",
                            "Property",
                            "Variable",
                        },
                    },
                    window = {
                        auto_size = true,
                        border = "rounded",
                    },
                    preview = {
                        highlight_on_move = true,
                    },
                    movement = {
                        next = { "<C-n>", "<DOWN>" },
                        previous = { "<C-p>", "<UP>" },
                        close = { "<ESC>" },
                        select = { "<CR>" },
                        delete_word = {},
                        clear_line = {},
                    },
                },
            },
            ui_select = { enable = false },
        },
        keys = {
            { "<leader>ns", "<cmd>Namu symbols<cr>",     desc = "LSP symbols (buffer)" },
            { "<leader>nw", "<cmd>Namu workspace<cr>",   desc = "LSP symbols (workspace)" },
            { "<leader>nb", "<cmd>Namu watchtower<cr>",  desc = "Symbols across open buffers" },
            { "<leader>nd", "<cmd>Namu diagnostics<cr>", desc = "Diagnostics for buffer or workspace" },
        },
    },
}
