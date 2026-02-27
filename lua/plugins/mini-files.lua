return {
    {
        "nvim-mini/mini.files",
        version = "*",
        config = function()
            require("mini.files").setup({
                mappings = {
                    go_in_plus = "l",
                },
            })

            vim.keymap.set("n", "<leader>e", "<cmd>lua MiniFiles.open()<CR>", { desc = "open mini-files explorer" })
        end,
    },
}
