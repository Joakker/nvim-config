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

return M
