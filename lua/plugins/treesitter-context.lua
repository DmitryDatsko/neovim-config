return {
    {
        "nvim-treesitter/nvim-treesitter-context",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "BufReadPost",
        config = function()
            require("treesitter-context").setup({
                enable = true,
                multiwindow = true,
                line_numbers = true,
                max_lines = 0,
                min_window_height = 0,
                multiline_threshold = 20,
                trim_scope = "outer",
                mode = "cursor",
                separator = nil,
            })

            vim.keymap.set("n", "[c", function()
                require("treesitter-context").go_to_context(vim.v.count1)
            end, { silent = true, desc = "Jump to context (sticky scroll)" })
        end,
    },
}
