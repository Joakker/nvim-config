---@class AutoCmd
---@field [1]       string
---@field [2]       string|function
---@field buffer    boolean|nil

---@class AuGroup
---@field name  string
---@field reset boolean|'"buffer"'
---@field cmds  AutoCmd[]

---@type function[]
_G.autocmd_rhs = {}

---Add the given function to the autocmd_rhs global, such that it avoids repeats. Returns
---the index of the function into the autocmd_rhs table.
---@param  f        function
---@return number
local function add(f)
    for i, v in ipairs(autocmd_rhs) do
        if f == v then
            return i
        end
    end
    local l = #autocmd_rhs + 1
    autocmd_rhs[l] = f
    return l
end

---Creates a single autocommand in the current augroup.
---@param spec AutoCmd
local function cmd(spec)
    local event = spec[1]
    ---@type string
    local command

    local test = spec[2]
    if type(test) == 'function' then
        local idx = add(test)
        command = ('lua autocmd_rhs[%d]()'):format(idx)
    else
        command = test
    end

    if spec.buffer then
        vim.cmd(('autocmd %s <buffer> %s'):format(event, command))
    else
        vim.cmd(('autocmd %s %s'):format(event, command))
    end
end

---Creates an autocommand group.
---@param spec AuGroup
local function group(spec)
    vim.cmd(('augroup %s'):format(spec.name))

    if spec.reset == 'buffer' then
        vim.cmd 'autocmd! * <buffer>'
    elseif spec.reset then
        vim.cmd 'autocmd! *'
    end

    for _, c in ipairs(spec.cmds) do
        cmd(c)
    end

    vim.cmd 'augroup END'
end

return {
    group = group,
    cmd = cmd,
}
