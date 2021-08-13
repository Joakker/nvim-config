local on_attach = require('lsp.utils').on_attach

require('lspconfig').bashls.setup {
    on_attach = on_attach,
}
