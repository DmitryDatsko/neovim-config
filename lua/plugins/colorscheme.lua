return {
    {
        "sainnhe/everforest",
        enabled = true,
        priority = 1000,
        lazy = false,
        styles = {
            bold = true,
            italic = false,
        },
        config = function()
            vim.g.everforest_background = "soft" -- "soft" | "medium" | "hard"
            vim.g.everforest_better_perfomance = 1
        end,
    },
}
