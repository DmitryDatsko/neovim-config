return {
    {
        "nvim-mini/mini.tabline",
        enabled = false,
        version = false,
        config = function()
            require("mini.tabline").setup({
                show_icons = true,
                tabpage_section = "left"
            })
        end,
    }
}
