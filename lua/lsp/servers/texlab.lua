local on_attach = require 'lsp.on_attach'

require('lspconfig').texlab.setup {
    filetypes = { 'latex' },
    on_attach = on_attach,
}
