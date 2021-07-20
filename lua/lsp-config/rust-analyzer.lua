local utils = require 'lsp-config.utils'

require('rust-tools').setup {
    inlay_hints = {
        parameter_hints_prefix = '← ',
    },
}

require('lspconfig').rust_analyzer.setup {
    cmd = { 'rust-analyzer' },
    on_attach = utils.on_attach,
}
