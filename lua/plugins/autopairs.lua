require'nvim-autopairs'.setup()

function _G.completion_confirm()
    local npairs = require 'nvim-autopairs'
    if vim.fn.pumvisible() ~= 0 then
        if vim.fn.complete_info()['selected'] ~= -1 then
            vim.fn['compe#confirm']()
            return npairs.esc ''
        else
            vim.api.nvim_select_popupmenu_item(0, false, false, {})
            vim.fn['compe#confirm']()
            return npairs.esc '<C-n>'
        end
    else
        return npairs.check_break_line_char()
    end
end

require'utils'.set_keymap('i', '<CR>', 'v:lua.completion_confirm()',
                          {expr = true, noremap = true})
