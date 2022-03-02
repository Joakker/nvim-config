local wk = require 'which-key'

return function(_, bufnr)
    wk.register({
        K = { vim.lsp.buf.hover, 'Hover' },
    }, { buffer = bufnr })
    wk.register({
        ['ca'] = { vim.lsp.buf.code_action, 'Code Action' },
    }, { prefix = '<leader>', buffer = bufnr })
end
