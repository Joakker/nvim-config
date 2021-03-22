local M = {}

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

function M.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

function M.extend(table1, table2)
    return vim.tbl_extend('force', table1, table2)
end

function M.reload_config()
    vim.cmd('luafile ' .. vim.env.MYVIMRC)
    print 'Reloaded config! 🥰'
end

function M.set_keymap(mode, lhs, rhs, opts, buffer)
    local options = {noremap = true, silent = true}
    if opts then options = M.extend(options, opts) end
    if buffer then
        vim.api.nvim_buf_set_keymap(0, mode, lhs, rhs, options)
    else
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

return M
