local on_attach = require 'lsp.on_attach'

require('lspconfig').clangd.setup {
    cmd = { 'clangd-11', '--background-index' },
    on_attach = on_attach,
}
