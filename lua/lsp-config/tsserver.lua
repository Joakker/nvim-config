local utils = require 'lsp-config.utils'

require'lspconfig'.tsserver.setup {on_attach = utils.on_attach}
