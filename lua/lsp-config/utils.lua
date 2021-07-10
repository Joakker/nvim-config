local k = require 'keymap'

local function on_attach(client, bufnr)
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    k.inoremap {'<TAB>', tab_completion, expr = true, buffer = bufnr}
    k.snoremap {'<TAB>', tab_completion, expr = true, buffer = bufnr}
    k.inoremap {'<S-TAB>', shift_tab_completion, expr = true, buffer = bufnr}
    k.snoremap {'<S-TAB>', shift_tab_completion, expr = true, buffer = bufnr}

    k.nnoremap {'gD', vim.lsp.buf.declaration, buffer = bufnr}
    k.nnoremap {'gd', vim.lsp.buf.definition, buffer = bufnr}
    k.nnoremap {'gi', vim.lsp.buf.implementation, buffer = bufnr}
    k.nnoremap {'gr', vim.lsp.buf.references, buffer = bufnr}

    k.nnoremap {'[d', vim.lsp.diagnostic.goto_prev, buffer = bufnr}
    k.nnoremap {']d', vim.lsp.diagnostic.goto_next, buffer = bufnr}

    k.nnoremap {'K', require'lspsaga.hover'.render_hover_doc, buffer = bufnr}

    k.nnoremap {
        '<leader>ca',
        require'lspsaga.codeaction'.code_action,
        buffer = bufnr,
    }
    k.nnoremap {'<leader>rn', require'lspsaga.rename'.rename, buffer = bufnr}

    k.nnoremap {
        '<C-f>',
        function()
            require'lspsaga.action'.smart_scroll_with_saga(1)
        end,
        buffer = bufnr,
    }
    k.nnoremap {
        '<C-b>',
        function()
            require'lspsaga.action'.smart_scroll_with_saga(-1)
        end,
        buffer = bufnr,
    }

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
        k.nnoremap {'<leader>lf', vim.lsp.buf.formatting}
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
