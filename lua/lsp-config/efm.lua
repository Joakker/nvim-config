local utils = require 'lsp-config.utils'

local luaFormat = {
    formatCommand = 'lua-format -i --no-keep-simple-function-one-line'
        .. ' --no-break-after-operator --column-limit=80'
        .. ' --break-after-table-lb',
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
