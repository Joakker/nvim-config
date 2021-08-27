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

parser_configs.norg = {
    install_info = {
        url = 'https://github.com/vhyrro/tree-sitter-norg',
        files = { 'src/parser.c' },
        branch = 'main',
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = {
        enable = true,
    },
    playground = {
        enable = true,
    },
    query_linter = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
}
