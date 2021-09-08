local server_dir = require('lsp.utils').server_dir
local on_attach = require 'lsp.on_attach'

local omnisharp = server_dir .. '/omnisharp/run'
local pid = vim.fn.getpid()

require('lspconfig').omnisharp.setup {
    cmd = { omnisharp, '--languageserver', '--hostPID', tostring(pid) },
    on_attach = on_attach,
}
