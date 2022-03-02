return {
    cmd = {
        vim.fn.stdpath 'data'
            .. '/lsp_servers/sumneko_lua/extension/server/bin/Linux/lua-language-server',
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
            },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false },
        },
    },
}
