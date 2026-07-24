return {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require("undotree").setup({
            float_diff = true,
            layout = "left_bottom",
        })
        vim.keymap.set("n", "<leader>u", require("undotree").toggle, { desc = "Toggle undotree" })
    end,
}
