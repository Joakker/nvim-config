local json = require 'json'
local on_attach = require('lsp.utils').on_attach
local List = require 'plenary.collections.py_list'

--@type string
local tags = (function()
    local raw_list = json 'gopls.tags' or {}
    local list_obj = List.new(raw_list)
    return list_obj:join ','
end)()

require('go').setup {
    lint_prompt_style = 'vt',
}

require('lspconfig').gopls.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
    end,
    settings = {
        gopls = {
            buildFlags = { '-tags=' .. tags },
            codelenses = {
                generate = true,
            },
        },
    },
}
