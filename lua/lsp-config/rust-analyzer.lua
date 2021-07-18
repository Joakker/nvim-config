local utils = require 'lsp-config.utils'

local bin_path = utils.serv_path .. '/rust-analyzer'

require('lspconfig').rust_analyzer.setup {
    cmd = { bin_path },
    on_attach = utils.on_attach,
}
