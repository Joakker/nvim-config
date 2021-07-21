local k = require 'keymap'

local npairs = require 'nvim-autopairs'

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function prior_is_ws()
    local col = vim.fn.col '.' - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
        return true
    else
        return false
    end
end

local function tab_completion()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif prior_is_ws() then
        return t '<TAB>'
    else
        return vim.fn['compe#complete']()
    end
end

local function shift_tab_completion()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    else
        return t '<S-TAB>'
    end
end

local function completion_confirm()
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

local function on_attach(client, bufnr)
    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

    k.inoremap { '<TAB>', tab_completion, expr = true, buffer = bufnr }
    k.snoremap { '<TAB>', tab_completion, expr = true, buffer = bufnr }
    k.inoremap { '<S-TAB>', shift_tab_completion, expr = true, buffer = bufnr }
    k.snoremap { '<S-TAB>', shift_tab_completion, expr = true, buffer = bufnr }

    k.nnoremap { 'gD', vim.lsp.buf.declaration, buffer = bufnr }
    k.nnoremap { 'gd', vim.lsp.buf.definition, buffer = bufnr }
    k.nnoremap { 'gi', vim.lsp.buf.implementation, buffer = bufnr }
    k.nnoremap { 'gr', vim.lsp.buf.references, buffer = bufnr }
    k.nnoremap { 'gT', vim.lsp.buf.type_definition, buffer = bufnr }

    k.nnoremap { '[d', vim.lsp.diagnostic.goto_prev, buffer = bufnr }
    k.nnoremap { ']d', vim.lsp.diagnostic.goto_next, buffer = bufnr }

    k.nnoremap { 'K', require('lspsaga.hover').render_hover_doc, buffer = bufnr }

    k.nnoremap {
        '<leader>ca',
        require('lspsaga.codeaction').code_action,
        buffer = bufnr,
    }
    k.nnoremap { '<leader>rn', require('lspsaga.rename').rename, buffer = bufnr }

    k.nnoremap {
        '<C-f>',
        function()
            require('lspsaga.action').smart_scroll_with_saga(1)
        end,
        buffer = bufnr,
    }
    k.nnoremap {
        '<C-b>',
        function()
            require('lspsaga.action').smart_scroll_with_saga(-1)
        end,
        buffer = bufnr,
    }

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
        augroup lsp_doc_highlight
            autocmd! * <buffer>
            autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]],
            false
        )
    end
    if client.resolved_capabilities.document_formatting then
        k.nnoremap { '<leader>lf', vim.lsp.buf.formatting }
        vim.api.nvim_exec(
            [[
        augroup lsp_formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync({}, 5000)
        augroup END
        ]],
            false
        )
    end
end

return {
    on_attach = on_attach,
    serv_path = vim.fn.stdpath 'data' .. '/servers',
    completion_confirm = completion_confirm,
}
