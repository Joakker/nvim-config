return {
    filetypes = { 'latex' },
    cmd = {
        vim.fn.stdpath 'data' .. '/lsp_servers/latex/texlab',
    },
}
