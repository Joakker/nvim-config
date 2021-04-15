local saga = require 'lspsaga'

saga.init_lsp_saga()

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    preselect = 'enable',
    source = {
        path = true,
        buffer = true,
        nvim_lsp = true,
        nvim_lua = true,
        snippets_nvim = true
    }
}

local servers = {
    'efm',
    'clangd',
    'gdscript',
    'omnisharp',
    'gopls',
    -- 'jedi',
    'pyright',
    'sumneko',
    'vimls',
    'rust_analyzer',
    'tsserver'
}

for _, server in pairs(servers) do import('lsp-config.' .. server) end
