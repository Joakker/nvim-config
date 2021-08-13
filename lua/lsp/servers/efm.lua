local on_attach = require('lsp.utils').on_attach

local lua_args = {
    {
        formatCommand = 'stylua --search-parent-directories -',
        formatStdin = true,
    },
}

local json_args = {
    {
        formatCommand = 'prettier --stdin-filepath ${INPUT} --parser json',
        formatStdin = true,
    },
}

local javascript_args = {
    {
        formatCommand = 'prettier --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

require('lspconfig').efm.setup {
    on_attach = on_attach,
    filetypes = { 'lua', 'javascript', 'typescript', 'json' },
    init_options = { documentFormatting = true, codeAction = false },
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = { '.git', 'stylua.toml' },
        languages = {
            lua = lua_args,
            json = json_args,
            javascript = javascript_args,
            typescript = javascript_args,
        },
    },
}
