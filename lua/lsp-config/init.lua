import'lsp-config.completion-icons'.init {with_text = true}

local g = vim.g

g.completion_confirm_key = ''
g.completion_trigger_character = {'.'}
g.completion_trigger_keyword_length = 3
g.completion_enable_snippet = 'snippets.nvim'

local servers = {
    'efm', 'clangd', 'gdscript', 'omnisharp', 'gopls', 'jedi', 'sumneko'
}

for _, server in pairs(servers) do import('lsp-config.' .. server) end
