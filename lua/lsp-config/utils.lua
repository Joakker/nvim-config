local function on_attach(client, bufnr)
    local set_keymap = require'utils'.set_keymap
    local opts = {noremap = true, silent = true}
    set_keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts, bufnr)
    set_keymap('i', '<TAB>', '<Plug>(completion_smart_tab)', {noremap = false},
               bufnr)
    set_keymap('i', '<S-TAB>', '<Plug>(completion_smart_s_tab)',
               {noremap = false}, bufnr)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        augroup lsp_doc_highlight
            autocmd! * <buffer>
            autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
    if client.resolved_capabilities.document_formatting then
        set_keymap('n', '<leader>lf', '<CMD>lua vim.lsp.buf.formatting()<CR>')
    end
end

return {on_attach = on_attach, serv_path = vim.fn.stdpath 'data' .. '/servers'}
