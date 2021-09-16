local server_dir = require('lsp.utils').server_dir .. '/lua-language-server'
local bin_path = server_dir .. '/bin/Linux/lua-language-server'

local rtp = vim.split(package.path, ';')
table.insert(rtp, 'lua/?.lua')
table.insert(rtp, 'lua/?/init.lua')

local on_attach = require 'lsp.on_attach'

local work_lib = (function()
    ---@type string[]
    local result = vim.api.nvim_get_runtime_file('', true)
    table.insert(result, vim.fn.expand '$VIMRUNTIME/lua')
    table.insert(result, vim.fn.expand '$VIMRUNTIME/lua/vim')
    table.insert(result, vim.fn.expand '$VIMRUNTIME/lua/vim/lsp')
    return result
end)()

require('lspconfig').sumneko_lua.setup {
    cmd = { bin_path, '-E', server_dir .. '/main.lua' },
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = rtp,
                special = {
                    import = 'require',
                },
                unicodeName = true,
            },
            diagnostics = {
                globals = { 'vim' },
                libraryFiles = 'Enable',
            },
            workspace = {
                library = work_lib,
                preloadFileSize = 10,
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
}
