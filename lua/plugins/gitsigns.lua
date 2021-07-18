vim.cmd [[hi GitSignsChange guifg=#BF616A]]
vim.cmd [[hi GitSignsAdd    guifg=#4C566A]]
vim.cmd [[hi GitSignsChange guifg=#EBCB8B]]

require('gitsigns').setup {
    signs = {
        add = { text = '┃' },
        change = { text = '┃' },
        delete = { text = '┃' },
        topdelete = { text = '┏' },
        changedelete = { text = '┣' },
    },
}
