local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

parser_config.norg = {
    install_info = {
        url = 'https://github.com/nvim-neorg/tree-sitter-norg',
        files = { 'src/parser.c', 'src/scanner.cc' },
        branch = 'main',
    },
}

parser_config.kotlin = {
    install_info = {
        url = '~/Projects/tree-sitter-kotlin',
        files = { 'src/parser.c' },
    },
}

require('nvim-treesitter.configs').setup {
    ensure_installed = 'maintained',
    highlight = { enable = true },
    playground = { enable = true },
    query_linter = { enable = true },
}
