local on_attach = require('lsp.utils').on_attach

require('lspconfig').gdscript.setup {
    on_attach = on_attach,
}
