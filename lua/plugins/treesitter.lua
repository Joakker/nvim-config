vim.g.nvcode_termcolors = 256

local parser_config = require'nvim-treesitter.parsers'.get_parser_configs()

parser_config.indigo = {
    install_info = {
        url = '~/Projects/tree-sitter-indigo',
        files = {'src/parser.c'},
    },
}

require'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    highlight = {enable = true, disable = {'packer'}},
    rainbow = {enable = true, extended_mode = true},
    indent = {enable = true},
    playground = {enable = true},
    query_linter = {enable = true},
}
