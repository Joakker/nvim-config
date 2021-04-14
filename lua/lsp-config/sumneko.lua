local utils = require 'lsp-config.utils'

local lua_dir = utils.server_dir .. '/lua'
local lua_bin = lua_dir .. '/bin/Linux/lua-language-server'

local function get_paths()
    local paths = {}
    paths[vim.fn.stdpath 'config'] = true
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. '/lua'
        if vim.fn.isdirectory(lua_path) then paths[lua_path] = true end
    end
    paths[vim.fn.expand '$VIMRUNTIME/lua'] = true
    paths[vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true
    return paths
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {lua_bin, '-E', lua_dir .. '/main.lua'},
    on_attach = utils.on_attach,
    settings = {
        Lua = {
            hint = {enable = true},
            runtime = {version = 'LuaJIT', special = {import = 'require'}},
            diagnostics = {globals = {'vim', 'import', 'inspect'}},
            workspace = {library = get_paths()}
        }
    }
}
