local function on_attach(client, bufnr)
    local _set_keymap = require'utils'.set_keymap
    local _opts = {noremap = true, silent = true}

    local function set_keymap(mode, lhs, rhs, opts)
        _set_keymap(mode, lhs, rhs, opts or _opts, bufnr)
    end

    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    set_keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>')
    set_keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>')
    set_keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>')
    set_keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>')

    set_keymap('n', '[d', '<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>')
    set_keymap('n', ']d', '<CMD>lua vim.lsp.diagnostic.goto_next()<CR>')

    set_keymap('n', 'K',
               '<CMD>lua require"lspsaga.hover".render_hover_doc()<CR>')

    set_keymap('i', '<TAB>', '<Plug>(completion_smart_tab)', {noremap = false})
    set_keymap('i', '<S-TAB>', '<Plug>(completion_smart_s_tab)',
               {noremap = false})

    set_keymap('n', '<leader>ca',
               '<CMD>lua require"lspsaga.codeaction".code_action()<CR>')
    set_keymap('n', '<leader>rn',
               '<CMD>lua require"lspsaga.rename".rename()<CR>')

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
        vim.api.nvim_exec([[
        augroup lsp_formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
        augroup END
        ]], false)
    end
end

return {
    on_attach = on_attach,
    serv_path = vim.fn.stdpath 'data' .. '/servers',
    completion_confirm = completion_confirm,
}
