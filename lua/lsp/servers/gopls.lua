local on_attach = require 'lsp.on_attach'

require('lspconfig').gopls.setup {
    on_attach = on_attach,
}
