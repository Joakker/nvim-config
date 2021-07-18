local g = vim.g

g.completion_enable_snippet = 'UltiSnips'

g.UltiSnipsExpandTrigger = '<TAB>'
g.UltiSnipsJumpForwardTrigger = '<C-l>'
g.UltiSnipsBackwardTrigger = '<C-h>'

g.completion_confirm_key = ''

vim.lsp.protocol.CompletionItemKind = {
    '   (Text) ',
    '   (Method)',
    '   (Function)',
    '   (Constructor)',
    ' ﴲ  (Field)',
    '[] (Variable)',
    '   (Class)',
    ' ﰮ  (Interface)',
    '   (Module)',
    ' 襁 (Property)',
    '   (Unit)',
    '   (Value)',
    ' 練 (Enum)',
    '   (Keyword)',
    ' ﬌  (Snippet)',
    '   (Color)',
    '   (File)',
    '   (Reference)',
    '   (Folder)',
    '   (EnumMember)',
    ' ﲀ  (Constant)',
    ' ﳤ  (Struct)',
    '   (Event)',
    '   (Operator)',
    '   (TypeParameter)',
}

local k = require 'keymap'

k.inoremap { '<CR>', require('lsp-config.utils').completion_confirm, expr = true }
k.inoremap { '<C-Space>', vim.fn['compe#complete'], expr = true }

local servers = {
    'sumneko',
    'omnisharp',
    'pyright',
    'tsserver',
    'vimls',
    'bashls',
    'gopls',
    'gdscript',
    'clangd',
    'efm',
    'rust-analyzer',
    'texlab',
}

require('lspsaga').init_lsp_saga()

for _, server in ipairs(servers) do
    import('lsp-config.' .. server)
end

require('compe').setup {
    enabled = true,
    source = { nvim_lsp = true, ultisnips = true },
}
