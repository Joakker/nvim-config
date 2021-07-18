local utils = require 'lsp-config.utils'

require('lspconfig').clangd.setup {
    cmd = { 'clangd-11', '--background-index' },
    on_attach = function(client, bufnr)
        -- client.resolved_capabilities.document_formatting = false
        utils.on_attach(client, bufnr)
    end,
}
