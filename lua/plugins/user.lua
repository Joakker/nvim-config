-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        ---@type CatppuccinOptions
        opts = {
            flavour = 'mocha',
            transparent_background = true,
            integrations = {
                alpha = true,
                cmp = true,
                which_key = true,
                notify = true,
            },
        },
    },
}
