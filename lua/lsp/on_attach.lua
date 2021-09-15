local wk = require 'which-key'
local telescope = require 'telescope.builtin'

---Common on_attach function for lsp clients. All clients are supposed to call it to set
---everything.
---@param client table
---@param bufnr number
return function(client, bufnr)
    wk.register({
        K = { vim.lsp.buf.hover, 'Hover' },
        g = {
            name = 'Go To',
            r = { telescope.lsp_references, 'References' },
            i = { telescope.lsp_implementations, 'Implementations' },
            d = { telescope.lsp_definitions, 'Definitions' },
            T = { vim.lsp.buf.type_definition, 'Type Definitions' },
        },
        ['[e'] = { vim.lsp.diagnostic.goto_prev, 'Previous Diagnostic' },
        [']e'] = { vim.lsp.diagnostic.goto_next, 'Next Diagnostic' },
        ['<leader>rn'] = { vim.lsp.buf.rename, 'Rename' },
        ['<leader>c'] = {
            name = 'Lsp Code...',
        },
    }, {
        buffer = bufnr,
    })

    if client.resolved_capabilities.code_action then
        wk.register({ ['<leader>ca'] = { vim.lsp.buf.code_action, 'Action' } }, {
            buffer = bufnr,
        })
    end
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
        augroup lsp_formatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync({}, 5000)
        augroup END
        ]]
        wk.register({ ['<leader>cf'] = { vim.lsp.buf.formatting, 'Formatting' } }, {
            buffer = bufnr,
        })
    end
end
