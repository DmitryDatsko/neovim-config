return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        enabled = true,
        config = function()
            local wk = require("which-key")

            wk.setup({
                preset = "helix",
                delay = 300,
                win = {
                    border = "rounded",
                    padding = {1,2}
                },
                filter = function(mapping)
                    return mapping.desc and mapping.desc ~= ""
                end,
            })

            wk.add({
                {
                    "<leader>?",
                    function()
                        wh.show({ global = false })
                    end,
                    desc = "Buffer Local Keymaps (which-key)",
                },
            })
        end,
    },
}
