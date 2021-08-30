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
    playground = {
        enable = true,
    },
    query_linter = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        colors = {
            '#DE3C4B',
            '#912F40',
            '#C678DD',
            '#035E7B',
            '#FF8864',
        },
        termcolors = { '1', '1', '1', '1', '1', '1', '1' },
    },
}
