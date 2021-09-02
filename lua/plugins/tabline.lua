local fill_color = '#812F40'

local ignored_ft = {
    qf = true,
    ['dap-repl'] = true,
}

require('bufferline').setup {
    highlights = {
        fill = { guibg = fill_color },
        separator = { guifg = fill_color },
        separator_visible = { guifg = fill_color },
        separator_selected = { guifg = fill_color },
    },
    options = {
        diagnostics = 'nvim_lsp',
        separator_style = 'slant',
        custom_filter = function(bufnr)
            if not ignored_ft[vim.bo[bufnr].filetype] then
                return true
            end
        end,
    },
}
