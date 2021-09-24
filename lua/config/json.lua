local data = (function()
    local path = find_ancestor 'nvim-config.json5'
    if not path then
        return {}
    end

    local f = io.open(path, 'rb')
    if not f then
        return {}
    end

    local content = f:read '*a'
    f:close()
    return require('json5').parse(content)
end)()

---Return the given configuration if defined, else return default.
---@param name    string
---@param default any|nil
---@return string|number|table|boolean
return function(name, default)
    local cur = data
    for field in name:gmatch '([^\\.]+)' do
        if type(cur) ~= 'table' then
            return default
        end
        cur = cur[field]
    end
    if cur == nil then
        return default
    end
    return cur
end
