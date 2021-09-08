local on_attach = require 'lsp.on_attach'

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

local json5_args = {
    {
        formatCommand = 'prettier --stdin-filepath ${INPUT} --parser json5',
        formatStdin = true,
    },
}

local javascript_args = {
    {
        formatCommand = 'prettier --stdin-filepath ${INPUT}',
        formatStdin = true,
    },
}

local sh_args = {
    {
        formatCommand = 'shfmt -filename ${INPUT} -',
        formatStdin = true,
    },
}

local python_args = {
    {
        formatCommand = 'black --quiet -',
        formatStdin = true,
    },
}

require('lspconfig').efm.setup {
    filetypes = { 'lua', 'javascript', 'typescript', 'json5', 'json', 'sh', 'python' },
    init_options = { documentFormatting = true, codeAction = false },
    on_attach = on_attach,
    settings = {
        rootMarkers = { '.git', 'stylua.toml' },
        languages = {
            lua = lua_args,
            javascript = javascript_args,
            typescript = javascript_args,
            json = json_args,
            json5 = json5_args,
            sh = sh_args,
            python = python_args,
        },
    },
}
