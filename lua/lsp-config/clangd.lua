local utils = require 'lsp-config.utils'

require'lspconfig'.clangd.setup {
    cmd = {'clangd-11', '--background-index'},
    on_attach = utils.on_attach
}
