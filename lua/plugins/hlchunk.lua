return {
    {
        "shellRaining/hlchunk.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("hlchunk").setup({
                chunk = { enable = false },
                indent = {
                    enable = true,
                    chars = { "┊" },
                    style = {
                        vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                    },
                },
                blank = { enable = false },
                line_num = {
                    enable = true,
                    use_treesitter = true,
                    style = "#FFBDEE",
                },
            })

            local line_num_enabled = true
            vim.keymap.set("n", "<leader>tl", function()
                if line_num_enabled then
                    vim.cmd("DisableHLLineNum")
                else
                    vim.cmd("EnableHLLineNum")
                end
                line_num_enabled = not line_num_enabled
            end, { desc = "Toggle hlchunk line_num" })
        end,
    },
}
