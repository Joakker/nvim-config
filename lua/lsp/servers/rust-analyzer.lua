local on_attach = require('lsp.utils').on_attach

require('rust-tools').setup {
    tools = {
        inlay_hints = {
            parameter_hints_prefix = '← ',
            other_hints_prefix = '→ ',
        },
    },
    server = {
        on_attach = on_attach,
    },
}
