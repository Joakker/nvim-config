local M = {}
function M.join(self, seq)
    local result = {}
    for i, element in pairs(seq) do
        table.insert(result, tostring(element))
        if i ~= #seq then table.insert(result, self) end
    end
    return table.concat(result)
end

function M.split(self, pattern)
    local result = {}
    for word in self:gmatch(pattern) do table.insert(result, word) end
    return result
end

return M
