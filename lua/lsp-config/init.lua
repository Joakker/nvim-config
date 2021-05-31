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

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function prior_is_ws()
    local col = vim.fn.col '.' - 1
    if col == 0 or vim.fn.getline '.':sub(col, col):match '%s' then
        return true
    else
        return false
    end
end

function _G.tab_completion()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif vim.fn['UltiSnips#CanExpandSnippet']() == 1
        or vim.fn['UltiSnips#CanJumpForwards']() == 1 then
        return t '<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>'
    elseif prior_is_ws() then
        return t '<TAB>'
    else
        return vim.fn['compe#complete']()
    end
end

function _G.shift_tab_completion()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    elseif vim.fn['UltiSnips#CanJumpBackwards']() == 1 then
        return t '<C-R>=UltiSnips#JumpBackwards()<CR>'
    else
        return t '<S-TAB>'
    end
end

function _G.completion_confirm()
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            return vim.fn['compe#confirm'](npairs.esc '<CR>')
        else
            return npairs.esc '<CR>'
        end
    else
        return npairs.autopairs_cr()
    end
end

require'utils'.set_keymap('i', '<CR>', 'v:lua.completion_confirm()',
                          {expr = true, noremap = true})

local servers = {
    'sumneko', 'omnisharp', 'pyright', 'tsserver', 'vimls', 'bashls', 'gopls',
    'gdscript', 'clangd', 'efm', 'rust-analyzer', 'texlab',
}

require'lspsaga'.init_lsp_saga()

-- vim.cmd [[ autocmd BufEnter * lua require 'completion'.on_attach() ]]

for _, server in ipairs(servers) do import('lsp-config.' .. server) end

require'compe'.setup {
    enabled = true,
    source = {nvim_lsp = true, ultisnips = true},
}

--[[ local sign_define = vim.fn.sign_define

sign_define('LspDiagnosticsSignError', {text = '', texthl = 'ErrorMsg'})
sign_define('LspDiagnosticsSignWarning', {text = '', texthl = 'WarningMsg'})
sign_define('LspDiagnosticsSignInformation', {text = '', texthl = 'MoreMsg'})
sign_define('LspDiagnosticsSignHint', {text = 'ﯦ', texthl = 'Label'}) ]]
