local k = require 'keymap'

---Common on_attach function for lsp clients. All clients are supposed to call it to set
---everything.
---@param client table
---@param bufnr number
return function(client, bufnr)
    local telescope = require 'telescope.builtin'

    k.nnoremap { 'K', vim.lsp.buf.hover, buffer = bufnr }

    k.nnoremap { 'gr', telescope.lsp_references, buffer = bufnr }
    k.nnoremap { 'gi', telescope.lsp_implementations, buffer = bufnr }
    k.nnoremap { 'gd', telescope.lsp_definitions, buffer = bufnr }
    k.nnoremap { 'gT', vim.lsp.buf.type_definition, buffer = bufnr }

    if client.resolved_capabilities.code_action then
        k.nnoremap { '<leader>ca', telescope.lsp_code_actions, buffer = bufnr }
    end
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
        augroup lsp_formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 5000)
        augroup END
        ]]
        k.nnoremap { '<leader>lf', vim.lsp.buf.formatting, buffer = bufnr }
    end
end
