local utils = require 'lsp-config.utils'

require('lspconfig').texlab.setup {
    filetypes = { 'latex' },
    cmd = { utils.serv_path .. '/texlab' },
    on_attach = utils.on_attach,
}
