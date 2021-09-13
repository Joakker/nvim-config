local on_attach = require 'lsp.on_attach'
local k = require 'keymap'

require('go').setup {
    lsp_cfg = true,
    lsp_on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        on_attach(client, bufnr)
        vim.cmd [[
        augroup gopls_fmt
            autocmd BufWritePre <buffer> silent lua require'go.format'.gofmt()
        augroup END
        ]]

        k.nnoremap { '<leader>gc', require('go.comment').gen }
    end,
    comment_placeholder = '   ',
    max_line_len = 100,
}
