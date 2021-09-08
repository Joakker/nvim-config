local on_attach = require 'lsp.on_attach'

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    settings = {
        python = {
            pythonPath = 'python3',
        },
    },
}
