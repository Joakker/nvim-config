local on_attach = require('lsp.utils').on_attach

require('lspconfig').texlab.setup {
    filetypes = { 'latex' },
    on_attach = on_attach,
}
