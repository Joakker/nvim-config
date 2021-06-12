local M = {}

local Path = require 'plenary.path'

local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- Replaces '<LUA>' by '<CMD>lua '
---@param   str     string
---@return  string
local function l(str)
    return str:gsub('<LUA>', '<CMD>lua ')
end

-- Sets the option key to value in the given scope, which can be one of:
-- - o: Global option
-- - b: Buffer option
-- - w: Window option
--
---@param   scope   string                  The scope of the option
---@param   key     string                  The name of the option
---@param   value   string|number|boolean   The value of the option
function M.opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

-- Wrapper around vim.tbl_extend so that it always forces extension
--
---@param   table1  table       The original table
---@param   table2  table       The entries to enter in table1
---@return  table
function M.extend(table1, table2)
    return vim.tbl_extend('force', table1, table2)
end

-- Sources $MYVIMRC to reload the configuration. Only packages loaded with import
-- will be affected. It is roughly equivalent to ':source $MYVIMRC' in vimL
function M.reload_config()
    vim.cmd('luafile ' .. vim.env.MYVIMRC)
    print 'Reloaded config! 🥰'
end

-- Wraps vim.api.nvim_buf_set_keymap() and vim.api.nvim_set_keymap(). Which one
-- will be called depends on whether the opts parameter contains a member called
-- 'buffer'. If it does, it must be the number of the buffer that the mapping
-- takes place in (0 for current buffer)
--
---@param   mode    string      The mode in which the mapping is valid
---@param   lhs     string      The keys that trigger the mapping
---@param   rhs     string      The value the mapping corresponds to
---@param   opts    table       The options for the mapping
function M.set_keymap(mode, lhs, rhs, opts, buffer)
    local options = {noremap = true, silent = true}
    rhs = l(rhs)
    if opts then options = M.extend(options, opts) end
    if buffer then
        vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
    else
        vim.api.nvim_set_keymap(mode, lhs, rhs, options)
    end
end

function M.has_parent(dir, name)
    for _, path in ipairs(vim.split(dir, '/')) do
        if path == name then return true end
    end
end

---@param name string
---@return string
function M.find_in_parents(name)
    local cur = Path:new(vim.loop.cwd())
    local test_path = cur / name
    if test_path:exists() then return test_path:absolute() end
    for _, parent in ipairs(cur:parents()) do
        test_path = Path:new(parent) / name
        if test_path:exists() then return test_path:absolute() end
    end
    return nil
end

return M
