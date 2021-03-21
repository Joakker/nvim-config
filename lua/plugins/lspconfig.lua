local lspconf = require 'lspconfig'
local g = vim.g

g.completion_confirm_key = ''
g.completion_trigger_character = {'.'}
g.completion_trigger_keyword_length = 3
g.completion_enable_snippet = 'snippets.nvim'

local function on_attach(client, bufnr)
    local opts = { noremap  =true, silent = true}
    local function set_keymap(...)
        local o = {...}
        vim.api.nvim_buf_set_keymap(bufnr, o[1], o[2], o[3], o[4] or opts)
    end

    set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
    set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
    set_keymap('n', 'K',  '<CMD>lua vim.lsp.buf.hover()<CR>')
    set_keymap('i', '<TAB>', '<Plug>(completion_smart_tab)', {})
    set_keymap('i', '<S-TAB>', '<Plug>(completion_smart_s_tab)', {})
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_document_highlight
            autocmd! * <buffer>
            autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END]], false)
    end

    require 'completion'.on_attach(client)
end

local servers_path = vim.fn.stdpath'data' .. '/servers'

local lua_dir = servers_path .. '/lua'
local lua_bin = lua_dir .. '/bin/lua-language-server'

local function get_paths()
    local paths = {}
    paths[vim.fn.stdpath'config'] = true
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. '/lua'
        if vim.fn.isdirectory(lua_path) then
            paths[lua_path] = true
        end
    end
    paths[vim.fn.expand'$VIMRUNTIME/lua'] = true
    paths[vim.fn.expand'$VIMRUNTIME/lua/vim/lsp'] = true
    return paths
end

lspconf.sumneko_lua.setup {
    cmd = {lua_bin, '-E', lua_dir .. '/main.lua'},
    on_attach = on_attach,
    settings = {
        Lua = {
            hint = {
                enable = true
            },
            runtime = {
                version = 'LuaJIT',
                special = {
                    import = 'require',
                }
            },
            diagnostics = {
                globals = {'vim', 'import'}
            },
            workspace = {
                library = get_paths()
            }
        }
    }
}

lspconf.jedi_language_server.setup {
    on_attach = on_attach
}

lspconf.gopls.setup {
    on_attach = on_attach
}

lspconf.gdscript.setup {
    on_attach = on_attach
}

local omn_bin = servers_path .. '/omnisharp/run'

lspconf.omnisharp.setup {
    cmd = {
        omn_bin,
        '--languageserver',
        '--hostPID',
        tostring(vim.fn.getpid())
    },
    on_attach = on_attach
}
