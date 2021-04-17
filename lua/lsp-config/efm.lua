local utils = require 'lsp-config.utils'

local lua_args = {
    {formatCommand = 'lua-format -i --column-limit=80', formatStdin = true}
}

require'lspconfig'.efm.setup {
    on_attach = utils.on_attach,
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {'lua', 'python'},
    settings = {rootMarkers = {'.git'}, languages = {lua = lua_args}}
}
