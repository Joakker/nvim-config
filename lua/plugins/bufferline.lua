require'bufferline'.setup {
    options = {
        separator_style = 'slant',
        show_buffer_close_icons = false,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count)
            return ' (' .. count .. ')'
        end,
        custom_filter = function(bufnr)
            if vim.bo[bufnr].filetype ~= 'qf' then return true end
        end,
    },
}
