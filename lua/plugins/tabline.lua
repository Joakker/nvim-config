local fill_color = '#D17181'

require('bufferline').setup {
    highlights = {
        fill = { guibg = fill_color },
        separator = { guifg = fill_color },
        separator_selected = { guifg = fill_color },
    },
    options = {
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
    },
}
