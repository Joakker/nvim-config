local g = vim.g

local saga = require 'lspsaga'

saga.init_lsp_saga()

g.completion_enable_auto_popup = false
g.completion_enable_aut_paren = true
g.completion_confirm_key = ''
g.completion_trigger_character = {'.'}
g.completion_trigger_keyword_length = 3
g.completion_enable_snippet = 'snippets.nvim'
g.completion_customize_lsp_label = {['snippets.nvim'] = '﬌ Snippet'}

local servers = {
    'efm', 'clangd', 'gdscript', 'omnisharp', 'gopls', 'jedi', 'sumneko',
    'vimls', 'rust_analyzer'
}

for _, server in pairs(servers) do import('lsp-config.' .. server) end
