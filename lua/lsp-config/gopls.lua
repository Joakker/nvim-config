local utils = require 'lsp-config.utils'

---@type string
local tags = (function()
    local List = require 'plenary.collections.py_list'
    local tags = require('config.json').get 'gopls.tags' or {}
    local list = List.new(tags)
    return list:join ','
end)()

require('lspconfig').gopls.setup {
    settings = {
        gopls = { buildFlags = { '-tags=' .. tags } },
    },
    on_attach = utils.on_attach,
}
