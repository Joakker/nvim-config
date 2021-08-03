local utils = require 'lsp.utils'

local lua_args = {
    {
        formatCommand = 'stylua -',
        formatStdin = true,
    },
}

require('lspconfig').efm.setup {
    on_attach = utils.on_attach,
    filetypes = { 'lua' },
    init_options = { documentFormatting = true, codeAction = false },
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = { '.git', 'stylua.toml' },
        languages = {
            lua = lua_args,
        },
    },
}
