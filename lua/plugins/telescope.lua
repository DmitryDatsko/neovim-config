return {
    {
        "nvim-telescope/telescope.nvim",
        event = "VeryLazy",
        enabled = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
            "andrew-george/telescope-themes",
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            width = 0.87,
                            height = 0.80,
                        },
                    },
                    sorting_strategy = "ascending",
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    path_display = { "smart" },
                    prompt_prefix = "Search 🔍  ",
                    selection_caret = " ",
                    file_ignore_patterns = { "node_modules", ".git/" },
                },
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
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        },
                    },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        hidden = true,
                        previewer = false,
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                    buffers = {
                        theme = "cursor",
                        previewer = false,
                    },
                },
            })

            telescope.load_extension("fzf")
            telescope.load_extension("themes")
            telescope.load_extension("ui-select")

            vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Fuzzy find rescent files" })
            vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "telescope live grep" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "telescope find buffers" })
            vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "telescope help page" })
            vim.keymap.set("n", "<leader>cm", builtin.git_commits, { desc = "telescope git commits" })
            vim.keymap.set("n", "<leader>gT", builtin.git_status, { desc = "telescope git status" })

            vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find, { desc = "find in file" })

            vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to Definition" })
            vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Go to References" })
            vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Go to Implementation" })
            vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "Go to Type Definition" })

            vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "Document Symbols" })
            vim.keymap.set("n", "<leader>lS", builtin.lsp_workspace_symbols, { desc = "Workspace Symbols" })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

            vim.keymap.set("n", "<leader>fWs", function()
                local word = vim.fn.expand("<cWORD>")
                builtin.grep_string({ search = word })
            end, { desc = "Find Connected Words under cursor" })
            vim.keymap.set("n", "<leader>ths", builtin.colorscheme,
                { noremap = true, silent = true, desc = "Theme Switcher" })

            vim.keymap.set("n", "<leader>fN", "<cmd>Telescope notify<CR>", { desc = "notifies list" })
        end,
    },
}
