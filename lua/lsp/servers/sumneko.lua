local utils = require 'lsp.utils'
local bin_path = utils.server_dir
    .. 'lua-language-server/bin/Linux/lua-language-server'

require('lspconfig').sumneko_lua.setup {
    cmd = { bin_path, '-E', utils.server_dir .. 'lua-language-server/main.lua' },
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file('lua/', false) },
            telemetry = { enable = false },
            completion = { keywordSnippet = 'Disable', callSnippet = 'Disable' },
        },
    },
}
