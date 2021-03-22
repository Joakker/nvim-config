local g = vim.g

require'lspkind'.init {}

g.completion_confirm_key = ''
g.completion_trigger_character = {'.'}
g.completion_trigger_keyword_length = 3
g.completion_enable_snippet = 'snippets.nvim'

local servers = {
    'efm', 'clangd', 'gdscript', 'omnisharp', 'gopls', 'jedi', 'sumneko'
}

for _, server in pairs(servers) do import('lsp-config.' .. server) end
