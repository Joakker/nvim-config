local utils = require 'lsp-config.utils'

local omn_bin = utils.server_dir .. '/omnisharp/run'

require'lspconfig'.omnisharp.setup {
    cmd = {omn_bin, '--languageserver', '--hostPID', tostring(vim.fn.getpid())},
    on_attach = utils.on_attach
}

