local utils = require 'lsp-config.utils'

require'lspconfig'.vimls.setup {on_attach = utils.on_attach}
