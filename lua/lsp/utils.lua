local k = require 'keymap'
local f = require 'plenary.functional'

---@param client table
---@param bufnr  integer
local function on_attach(client, bufnr)
    -- Basic mappings
    k.nnoremap { 'K', require('lspsaga.hover').render_hover_doc, buffer = bufnr }
    k.nnoremap {
        '<leader>ca',
        require('lspsaga.codeaction').code_action,
        buffer = bufnr,
    }
    k.nnoremap { '<leader>rn', require('lspsaga.rename').rename, buffer = bufnr }

    k.nnoremap { 'gT', vim.lsp.buf.type_definition, buffer = bufnr }
    k.nnoremap { 'gd', vim.lsp.buf.definition, buffer = bufnr }
    k.nnoremap { 'gr', vim.lsp.buf.references, buffer = bufnr }

    local scroll = require('lspsaga.action').smart_scroll_with_saga

    k.nnoremap { '<C-f>', f.partial(scroll, 1), buffer = bufnr }
    k.nnoremap { '<C-b>', f.partial(scroll, -1), buffer = bufnr }

    k.nnoremap {
        '[e',
        require('lspsaga.diagnostic').lsp_jump_diagnostic_prev,
        buffer = bufnr,
    }
    k.nnoremap {
        ']e',
        require('lspsaga.diagnostic').lsp_jump_diagnostic_next,
        buffer = bufnr,
    }

    -- Conditional functionality
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
        augroup lsp_formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 5000)
        augroup END
        ]]
        k.nnoremap { '<leader>lf', vim.lsp.buf.formatting_sync, buffer = bufnr }
    end
end

return {
    on_attach = on_attach,
    server_dir = vim.fn.stdpath 'data' .. '/servers/',
}
