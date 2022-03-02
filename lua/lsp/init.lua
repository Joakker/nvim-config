import 'lsp.cmp'

local lsp = require 'nvim-lsp-installer'
local on_attach = require 'lsp.on_attach'

local opts = { on_attach = on_attach }
local servers = setmetatable({}, {
    __index = function(_, name)
        local ok, tbl = pcall(require, 'lsp.servers.' .. name)
        if not ok then
            return opts
        end
        return vim.tbl_extend('force', opts, tbl)
    end,
})

lsp.on_server_ready(function(server)
    server:setup(servers[server.name])
end)
