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
                                path = vim.fn.stdpath("config") .. "/lua/colorscheme.lua"
                            },
                        }
                    }
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        hidden = true
                    },
                },
            })

            require("telescope").load_extension("fzf")
            require("telescope").load_extension("themes")

            vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find rescent files" })
            vim.keymap.set("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
            vim.keymap.set("n", "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
            vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
            vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
            vim.keymap.set("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

            vim.keymap.set("n", "<leader>fWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, { desc = "Find Connected Words under cursor" })
            vim.keymap.set("n", "<leader>ths", "<cmd>Telescope themes<CR>", { noremap = true, silent = true, desc = "Theme Switcher" })
        end,
    },
}
