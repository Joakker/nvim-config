local utils = require 'lsp.utils'
local on_attach = utils.on_attach
local server_dir = utils.server_dir

require('lspconfig').zls.setup {
    cmd = { server_dir .. 'zls/zig-out/bin/zls' },
    on_attach = utils.on_attach,
}
