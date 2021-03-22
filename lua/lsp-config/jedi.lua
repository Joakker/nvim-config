local utils = require 'lsp-config.utils'
require'lspconfig'.jedi_language_server.setup {on_attach = utils.on_attach}

