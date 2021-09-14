local luasnip = require 'luasnip'

local f = luasnip.f

local M = {}

---Returns the first character in the string that is a letter.
---@param  str string   The string to search through.
---@return string|nil
function M.first_letter(str)
    for c in str:gmatch '.' do
        if c:match '%a' then
            return c
        end
    end
    return nil
end

---Returns a ' ' if the given text has a length of 1 or more. Otherwise returns the empty
---string.
---@param str string
---@return string
function M.space_if_not_empty(str)
    if str:len() ~= 0 then
        return ' '
    end
    return ''
end

---If the insert node at the given index is not empty, insert a space.
---@param n integer
---@return table
function M.conditional_space(n)
    return f(function(args)
        ---@type string
        local text = args[1][1]

        return M.space_if_not_empty(text)
    end, n)
end

return M
