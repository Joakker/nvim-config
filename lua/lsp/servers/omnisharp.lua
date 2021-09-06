local utils = require 'lsp.utils'

local omnisharp = utils.server_dir .. 'omnisharp/run'
local pid = vim.fn.getpid()

require('lspconfig').omnisharp.setup {
    cmd = { omnisharp, '--languageserver', '--hostPID', tostring(pid) },
    on_attach = utils.on_attach,
}
