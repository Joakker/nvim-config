local cjson = require 'cjson'

local default = '{"foo":"bar"}'

local function readAll(file)
    if not file then return default end
    local f = io.open(file, 'rb')
    if not f then return default end
    local content = f:read('*a')
    f:close()
    return content
end

local content = cjson.decode(readAll(
                                 require'utils'.find_in_parents 'nvim-config.json'))

---@param name string
local function get(name)
    local cur = content
    for field in name:gmatch '([^\\.]+)' do
        if type(cur) ~= 'table' then return nil end
        cur = cur[field]
    end
    return cur
end

return {get = get}
