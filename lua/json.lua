local default = '{}'

local data = (function()
    local path = find_ancestor 'nvim-config.json'
    if not path then
        return default
    end
    local f = io.open(path, 'rb')
    if not f then
        return default
    end
    local content = f:read '*a'
    f:close()
    return require('json5').parse(content)
end)()

return function(name)
    local cur = data
    for field in name:gmatch '([^\\.]+)' do
        if type(cur) ~= 'table' then
            return nil
        end
        cur = cur[field]
    end
    return cur
end
