local utils = require 'lsp-config.utils'

require'lspconfig'.bashls.setup {on_attach = utils.on_attach}
