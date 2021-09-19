local utils = require 'lsp.utils'
local server_dir = utils.server_dir .. '/lua-language-server'
local bin_path = server_dir .. '/bin/Linux/lua-language-server'

local on_attach = require 'lsp.on_attach'
local capabilities = utils.capabilities

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, '?.lua')
table.insert(runtime_path, '?/init.lua')

local work_lib = (function()
    ---@type string[]
    local result = {}
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. '/lua/'
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand '$VIMRUNTIME/lua'] = true
    return result
end)()

local luadev = require('lua-dev').setup {
    lspconfig = {
        cmd = { bin_path, '-E', server_dir .. '/main.lua' },
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                    special = {
                        import = 'require',
                    },
                    unicodeName = true,
                    path = runtime_path,
                },
                diagnostics = {
                    globals = { 'vim' },
                    libraryFiles = 'Enable',
                },
                workspace = {
                    library = work_lib,
                    preloadFileSize = 10000,
                    maxPreload = 10000,
                },
                telemetry = {
                    enable = false,
                },
                completion = {
                    keywordSnippet = 'Disable',
                    callSnippet = 'Disable',
                    workspaceWord = false,
                },
            },
        },
    },
}

require('lspconfig').sumneko_lua.setup(luadev)
