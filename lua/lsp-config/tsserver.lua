local utils = require 'lsp-config.utils'

require('lspconfig').tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        utils.on_attach(client, bufnr)
    end,
    settings = { documentFormatting = false },
}
