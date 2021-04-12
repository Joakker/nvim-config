local utils = require 'lsp-config.utils'

require'lspconfig'.pyright.setup {on_attach = utils.on_attach}
