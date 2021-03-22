_G.MUtils = {}

require'nvim-autopairs'.setup()

function MUtils.completion_confirm()
    local npairs = require 'nvim-autopairs'
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            require'completion'.confirmCompletion()
            return npairs.esc '<C-y>'
        else
            vim.api.nvim_select_popupmenu_item(0, false, false, {})
            require'completion'.confirmCompletion()
            return npairs.esc '<C-n><C-y>'
        end
    else
        return npairs.check_break_line_char()
    end
end

require'utils'.set_keymap('i', '<CR>', 'v:lua.MUtils.completion_confirm()',
                          {expr = true, noremap = true})
