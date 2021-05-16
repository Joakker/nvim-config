local g = vim.g

g.completion_enable_snippet = 'UltiSnips'

g.UltiSnipsExpandTrigger = '<TAB>'
g.UltiSnipsJumpForwardTrigger = '<M-l>'
g.UltiSnipsBackwardTrigger = '<M-h>'

g.completion_confirm_key = ''

vim.lsp.protocol.CompletionItemKind = {
    '   (Text) ', '   (Method)', '   (Function)',
    '   (Constructor)', ' ﴲ  (Field)', '[] (Variable)', '   (Class)',
    ' ﰮ  (Interface)', '   (Module)', ' 襁 (Property)', '   (Unit)',
    '   (Value)', ' 練 (Enum)', '   (Keyword)', ' ﬌  (Snippet)',
    '   (Color)', '   (File)', '   (Reference)', '   (Folder)',
    '   (EnumMember)', ' ﲀ  (Constant)', ' ﳤ  (Struct)', '   (Event)',
    '   (Operator)', '   (TypeParameter)',
}

local npairs = require 'nvim-autopairs'

function _G.completion_confirm()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            require'completion'.confirmCompletion()
            return npairs.esc('<c-y>')
        else
            vim.api.nvim_select_popupmenu_item(0, false, false, {})
            require'completion'.confirmCompletion()
            return npairs.esc('<c-n><c-y>')
        end
    else
        return npairs.check_break_line_char()
    end
end

require'utils'.set_keymap('i', '<CR>', 'v:lua.completion_confirm()',
                          {expr = true, noremap = true})

local servers = {
    'sumneko', 'omnisharp', 'pyright', 'tsserver', 'vimls', 'bashls', 'gopls',
    'gdscript', 'clangd', 'efm', 'rust-analyzer', 'texlab',
}

require'lspsaga'.init_lsp_saga()

vim.cmd [[ autocmd BufEnter * lua require 'completion'.on_attach() ]]

for _, server in ipairs(servers) do import('lsp-config.' .. server) end

--[[ local sign_define = vim.fn.sign_define

sign_define('LspDiagnosticsSignError', {text = '', texthl = 'ErrorMsg'})
sign_define('LspDiagnosticsSignWarning', {text = '', texthl = 'WarningMsg'})
sign_define('LspDiagnosticsSignInformation', {text = '', texthl = 'MoreMsg'})
sign_define('LspDiagnosticsSignHint', {text = 'ﯦ', texthl = 'Label'}) ]]
