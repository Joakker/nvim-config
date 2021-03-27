local g = vim.g

g.vimwiki_hl_headers = 1
g.vimwiki_hl_cb_checked = 2
g.vimwiki_key_mappings = {
    global = false,
    text_objs = false,
    table_mappings = true,
    links = false,
    html = false
}
g.vimwiki_list = {
    {
        path = '~/Documents/Wiki',
        nested_syntaxes = {lua = 'lua', go = 'go'},
        links_space_char = ' '
    }
}
