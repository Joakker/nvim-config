local utils = require 'lsp-config.utils'

require'lspconfig'.rust_analyzer.setup {
    cmd = {utils.server_dir .. '/rust-analyzer/rust-analyzer'},
    on_attach = utils.on_attach
}
