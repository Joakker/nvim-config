local on_attach = require 'lsp.on_attach'

require('rust-tools').setup {
    autoSetHints = true,
    tools = {
        inlay_hints = {
            parameter_hints_prefix = '←',
            other_hints_prefix = '→',
        },
    },
    server = {
        on_attach = on_attach,
    },
}
