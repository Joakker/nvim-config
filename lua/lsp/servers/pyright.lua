return {
    cmd = {
        'node',
        vim.fn.stdpath 'data'
            .. '/lsp_servers/python/node_modules/pyright/langserver.index.js',
        '--stdio',
    },
}
