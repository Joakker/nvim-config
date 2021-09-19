local capabilities = vim.lsp.protocol.make_client_capabilities()

return {
    ---Install custom servers to this path
    ---@type string
    server_dir = vim.fn.stdpath 'data' .. '/servers',
    capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities),
}
