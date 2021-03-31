local utils = require 'lsp-config.utils'

local luaFormat = {
    formatCommand = 'lua-format -i' -- Use stdio
    .. ' --no-keep-simple-function-one-line' -- Always use multiline functions
    .. ' --no-break-after-operator' -- Break long statements before operator
    .. ' --column-limit=80' -- Max width is 80 characters
    -- .. ' --indent-width=2' -- Use 2 spaces for indents (sometimes)
    .. ' --break-after-table-lb' -- Break after table {
    .. ' --chop-down-table' -- Chop down
    ,
    formatStdin = true
}

local flake8Lint = {
    lintCommand = 'flake8 --ignore=E501,W503 --stdin-display-name ${INPUT} -',
    lintStdin = true,
    lintFormats = {'%f:%l:%c: %m'},
    lintIgnoreExitCode = true
}

local isortFormat = {formatCommand = 'isort --stdout -', formatStdin = true}
local blackFormat = {formatCommand = 'black -', formatStdin = true}

require'lspconfig'.efm.setup {
    init_options = {documentFormatting = true},
    root_dir = vim.loop.cwd,
    on_attach = utils.on_attach,
    filetypes = {'lua', 'python'},
    settings = {
        languages = {
            lua = {luaFormat},
            python = {blackFormat, isortFormat, flake8Lint}
        }
    }
}
