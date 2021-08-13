local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.indigo = {
    install_info = {
        url = '~/Projects/tree-sitter-indigo',
        files = { 'src/parser.c' },
    },
    filetype = 'indigo',
}

parser_configs.kotlin = {
    install_info = {
        url = '~/Projects/tree-sitter-kotlin',
        files = { 'src/parser.c' },
    },
    filetype = 'kotlin',
}

require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
    },
}
