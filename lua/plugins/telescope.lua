return{
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        enabled = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "andrew-george/telescope-themes",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {

                    path_display = { "smart" },
                    prompt_prefix = " ",
                    selection_caret = " ",
                    file_ignore_patterns = { "node_modules", ".git/"},

                    extensions = {
                        fzf = {
                            fuzzy = true,
                            override_generic_sorter = true,
                            override_file_sorter = true,
                            case_mode = "smart_case",
                        },
                        themes = {
                            enable_previewer = true,
                            enable_live_preview = true,
                            persist = {
                                enabled = true,
                                path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua",
                            },
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        hidden = true,
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("themes")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find rescent files" })
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope find buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope help page" })
            vim.keymap.set("n", "<leader>cm", builtin.git_commits, { desc = "telescope git commits" })
            vim.keymap.set("n", "<leader>gt", builtin.git_status, { desc = "telescope git status" })

            vim.keymap.set("n", "<leader>fWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, { desc = "Find Connected Words under cursor" })
            vim.keymap.set("n", "<leader>ths", builtin.colorscheme, { noremap = true, silent = true, desc = "Theme Switcher" })
        end,
    },
}
