local json = require 'json'
local on_attach = require('lsp.utils').on_attach
local List = require 'plenary.collections.py_list'
local k = require 'keymap'

--@type string
local tags = (function()
    local raw_list = json 'gopls.tags' or {}
    local list_obj = List.new(raw_list)
    return list_obj:join ','
end)()

require('go').setup {
    max_line_len = 80,
    dap_debug = true,
}

require('lspconfig').gopls.setup {
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        k.nnoremap { '<leader>gc', require('go.comment').gen }
        k.nnoremap { '<leader>gb', require('go.dap').breakpt }
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
