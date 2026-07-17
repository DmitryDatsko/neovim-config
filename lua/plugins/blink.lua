return {
    {
        "saghen/blink.cmp",
        version = "1.*",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("blink.cmp").setup({
                keymap = {
                    preset = "default",
                    ["<CR>"] = { "accept", "fallback" },
                    ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                    ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
                },
                appearance = { nerd_font_variant = "mono" },
                sources = {
                    default = { "lsp", "path", "snippets", "buffer" },
                },
                fuzzy = { implementation = "prefer_rust_with_warning" },
                signature = {
                    enabled = false,
                    window = {
                        border = "rounded",
                        show_documentation = false,
                    },
                },
            })
        end,
    },
}
