local function on_attach(client, bufnr)
    local _set_keymap = require'utils'.set_keymap
    local _opts = {noremap = true, silent = true}

    local function set_keymap(mode, lhs, rhs, opts)
        _set_keymap(mode, lhs, rhs, opts or _opts, bufnr)
    end

    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    set_keymap('n', 'gD', '<LUA>vim.lsp.buf.declaration()<CR>')
    set_keymap('n', 'gd', '<LUA>vim.lsp.buf.definition()<CR>')
    set_keymap('n', 'gi', '<LUA>vim.lsp.buf.implementation()<CR>')
    set_keymap('n', 'gr', '<LUA>vim.lsp.buf.references()<CR>')

    set_keymap('n', '[d', '<LUA>vim.lsp.diagnostic.goto_prev()<CR>')
    set_keymap('n', ']d', '<LUA>vim.lsp.diagnostic.goto_next()<CR>')

    set_keymap('n', 'K', '<LUA>require"lspsaga.hover".render_hover_doc()<CR>')

    set_keymap('i', '<TAB>', [[v:lua.tab_completion()]],
               {expr = true, noremap = false})
    set_keymap('s', '<TAB>', [[v:lua.tab_completion()]],
               {expr = true, noremap = false})
    set_keymap('i', '<S-TAB>', [[v:lua.shift_tab_completion()]],
               {expr = true, noremap = false})
    set_keymap('s', '<S-TAB>', [[v:lua.shift_tab_completion()]],
               {expr = true, noremap = false})

    set_keymap('n', '<leader>ca',
               '<LUA>require"lspsaga.codeaction".code_action()<CR>')
    set_keymap('n', '<leader>rn', '<LUA>require"lspsaga.rename".rename()<CR>')

    set_keymap('n', '<C-f>',
               '<LUA>require"lspsaga.action".smart_scroll_with_saga(1)<CR>')
    set_keymap('n', '<C-b>',
               '<LUA>require"lspsaga.action".smart_scroll_with_saga(-1)<CR>')

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
        set_keymap('n', '<leader>lf', '<LUA>vim.lsp.buf.formatting()<CR>')
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
