local M = {}

---@class Arg
---@field name      string
---@field type      string
---@field default   string

local map = vim.tbl_map
local max = vim.fn.max
local filter = vim.tbl_filter
local split = vim.split
local trim = vim.trim
local join = vim.fn.join

---@return Arg[]
local function separate_args(args, any)
    any = any or 'any'
    -- Split by commas
    args = split(args, ',')
    -- Split by equals
    args = map(function(element)
        return map(trim, split(element, '='))
    end, args)
    args = map(function(element)
        local default
        if #element == 1 then
            default = ''
        else
            default = element[2]
        end
        local name_and_type = map(trim,split(element[1], ':'))
        return {
            name = name_and_type[1],
            type = name_and_type[2] or any,
            default = default
        }
    end, args)
    return args
end

-- For languages where arguments can be annotated with types after a colon
-- (':'), this function is used to format the docstring for those arguments
--
---@param args      string      The inputed arguments
---@param any       string      The default type
---@return string
function M.format_annotated_args(args, any)
    local args_array = separate_args(args, any)
    local max_name_len = max(map(function(element)
        return #element.name
    end, args_array))
    local max_type_len = max(map(function(element)
        return #element.type
    end,args_array))
    local formatted = map(function(element)
        return '`' .. element.name .. '`'
            .. (' '):rep(max_name_len - #element.name + 1)
            .. element.type
            .. (' '):rep(max_type_len - #element.type + 1)
            .. ': TODO'
            .. '\n'
    end, args_array)
    return join(formatted, '    ')
end

return M
