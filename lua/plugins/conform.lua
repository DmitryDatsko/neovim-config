return {
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                async = true,
                formatters_by_ft = {
                    cs = { "csharp_formatter" },
                    csproj = { "csharp_formatter" },
                },
                formatters = {
                    csharp_formatter = {
                        command = "csharpier",
                        args = {
                            "format",
                            "--write-stdout"
                        },
                        to_stdin = true,
                    },
                },
                format_on_save = {
                    timeout = 100,
                    lsp_format = "fallback",
                },
            })

            vim.keymap.set({ "n", "x" }, "<leader>fm", function()
                require("conform").format { lsp_fallback = true }
            end, { desc = "general format file" })
        end,
    },
}
