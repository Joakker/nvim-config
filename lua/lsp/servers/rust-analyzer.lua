local on_attach = require('lsp.utils').on_attach

require('rust-tools').setup {
    tools = {
        inlay_hints = {
            parameter_hints_prefix = '← ',
            other_hints_prefix = '→ ',
        },
    },
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ['rust-analyzer'] = {
            assist = {
                importGranularity = 'module',
                importPrefix = 'by_self',
            },
            cargo = {
                loadOutDirsFromCheck = true,
            },
            procMacro = {
                enable = true,
            },
        }
    }
}
