local utils = require 'lsp-config.utils'

local lua_args = {
    {
        formatCommand = 'stylua -',
        formatStdin = true,
    },
}

local javascript_args = {
    {formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true},
}

local json_args = {
    {
        formatCommand = 'prettier --stdin-filepat ${INPUT} --parser json',
        formatStdin = true,
    },
}

if require'utils'.has_parent(vim.loop.cwd(), 'plenary.nvim') then
    lua_args[1].formatCommand = lua_args[1].formatCommand .. ' --indent-width=2'
end

require'lspconfig'.efm.setup {
    on_attach = utils.on_attach,
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {'lua', 'python', 'javascript', 'typescript', 'jsonc'},
    root_dir = vim.loop.cwd,
    settings = {
        rootMarkers = {'.git'},
        languages = {
            lua = lua_args,
            javascript = javascript_args,
            typescript = javascript_args,
            jsonc = json_args,
        },
    },
}
