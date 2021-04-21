local g = vim.g

g.completion_enable_snippet = 'UltiSnips'

g.UltiSnipsExpandTrigger = '<TAB>'
g.UltiSnipsJumpForwardTrigger = '<M-l>'
g.UltiSnipsBackwardTrigger = '<M-h>'

local npairs = require 'nvim-autopairs'
npairs.setup()

_G.MUtils = {}

g.completion_confirm_key = ''

function MUtils.completion_confirm()
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

require'utils'.set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()',
                          {expr = true, noremap = true})

local servers = {
    'sumneko', 'omnisharp', 'pyright', 'tsserver', 'vimls', 'bashls', 'gopls',
    'gdscript', 'clangd', 'efm',
}

vim.cmd [[ autocmd BufEnter * lua require 'completion'.on_attach() ]]

for _, server in ipairs(servers) do import('lsp-config.' .. server) end
