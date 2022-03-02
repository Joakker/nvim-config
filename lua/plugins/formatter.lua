vim.cmd [[
    augroup FormatAutoGroup
        autocmd!
        autocmd BufWritePost *.py,*.lua,*.go  FormatWrite
        autocmd BufWritePost *.json,*.js,*.md FormatWrite
    augroup END
]]

local prettier = {
    function()
        return {
            exe = 'prettier',
            args = {
                '--stdin-filepath',
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
        }
    end,
}

require('formatter').setup {
    filetype = {
        lua = {
            function()
                return {
                    exe = 'stylua',
                    args = { '-' },
                    stdin = true,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = 'black',
                    args = { '-' },
                    stdin = true,
                }
            end,
        },
        go = {
            function()
                return {
                    exe = 'gofumpt',
                    stdin = true,
                }
            end,
        },
        javascript = prettier,
        json = prettier,
        markdown = prettier,
    },
}
