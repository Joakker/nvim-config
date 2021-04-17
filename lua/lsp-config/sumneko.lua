local utils = require 'lsp-config.utils'
local bin_path = utils.serv_path .. '/lua/bin/Linux/lua-language-server'

local function get_workspace()
    local expand = vim.fn.expand
    local empty = vim.fn.empty
    local result = {
        [expand '$VIMRUNTIME/lua'] = true,
        [expand '$VIMRUNTIME/lua/vim/lsp'] = true
    }
    local rtp = vim.split(vim.o.runtimepath, ',')
    for _, path in pairs(rtp) do
        local newPath = expand(path .. '/lua')
        if not empty(newPath) then result[newPath] = true end
    end
    return result
end

require'lspconfig'.sumneko_lua.setup {
    cmd = {bin_path, '-E', utils.serv_path .. '/lua/main.lua'},
    on_attach = utils.on_attach,
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {globals = {'vim', 'inspect', 'import'}},
            workspace = {library = get_workspace()},
            telemetry = {enable = false}
        }
    }
}
