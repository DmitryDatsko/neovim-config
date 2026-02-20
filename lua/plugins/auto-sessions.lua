return{
    {
        "rmagatti/auto-session",
        enabled = true,
        lazy = false,
        config = function()
            require("auto-session").setup({
                auto_restore_enabled = false,
                auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Documents", "~/Desktop" },
            })
            vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd"})
            vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir"})
        end,
    },
}
