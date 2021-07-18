local utils = require 'lsp-config.utils'

require('lspconfig').gdscript.setup { on_attach = utils.on_attach }
