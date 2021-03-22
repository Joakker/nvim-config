local utils = require 'lsp-config.utils'

require'lspconfig'.gopls.setup {on_attach = utils.on_attach}
