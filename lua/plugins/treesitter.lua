vim.g.nvcode_termcolors = 256
require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = {enable = true},
    rainbow = {enable = true, extended_mode = true},
    playground = {enable = true},
    query_linter = {enable = true},
}
