local g = vim.g

g.vimwiki_hl_headers = 1
g.vimwiki_hl_cb_checked = 2
g.vimwiki_list = {
    {
        path = '~/Documents/Wiki',
        nested_syntaxes = {lua = 'lua', go = 'go'},
        links_space_char = ' '
    }
}
