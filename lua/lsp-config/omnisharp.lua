local utils = require 'lsp-config.utils'

local pid = vim.loop.getpid()
local omnisharp_bin = utils.serv_path .. '/omnisharp/run'

require'lspconfig'.omnisharp.setup {
    cmd = {omnisharp_bin, '--languageserver', '--hostPID', tostring(pid)},
    on_attach = utils.on_attach
}
