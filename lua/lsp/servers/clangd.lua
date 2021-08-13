local on_attach = require('lsp.utils').on_attach

require('lspconfig').clangd.setup {
    cmd = { 'clangd-11', '--background-index' },
    on_attach = on_attach,
}
