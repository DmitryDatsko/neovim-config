return {
	{
		"saghen/blink.cmp",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("blink.cmp").setup({
				keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" } },
				appearance = { nerd_font_variant = "mono" },
				completion = {
					default = { "lsp", "path", "snippets", "buffer" },
				},
				fuzzy = { implementation = "prefer_rust_with_warning" },
				signature = {
					enabled = true,
					window = {
						border = "rounded",
					},
				},
			})
		end,
	},
}
