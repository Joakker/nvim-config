local M = {}

_G.__mapping_rhs = _G.__mapping_rhs or {}

function _G.__mapping_exp(nr)
    return __mapping_rhs[nr]()
end

local cmd = [[<CMD>lua __mapping_rhs[%s]()<CR>]]
local exp = [[v:lua.__mapping_exp(%s)]]

local function insert(f)
    table.insert(__mapping_rhs, f)
    return #__mapping_rhs
end

local function make_mapper(mode, defaults, opts)
    local args, map_args = {}, {}
    for k, v in pairs(opts) do
        if type(k) == 'number' then
            args[k] = v
        else
            map_args[k] = v
        end
    end

    local lhs = opts.lhs or args[1]
    local rhs = opts.rhs or args[2]

    local map_opts = vim.tbl_extend('force', defaults, map_args)

    local mapping
    if type(rhs) == 'string' then
        mapping = rhs
    elseif type(rhs) == 'function' then
        assert(
            map_opts.noremap,
            'If `rhs` is a function, `noremap` must be true'
        )
        local func_id = insert(rhs)
        if map_opts.expr then
            mapping = exp:format(func_id)
        else
            mapping = cmd:format(func_id)
        end
    else
        error('Unexpected type for rhs:' .. tostring(rhs))
    end
    if not map_opts.buffer then
        vim.api.nvim_set_keymap(mode, lhs, mapping, map_opts)
    else
        local buffer = map_opts.buffer
        if buffer == true then
            buffer = 0
        end
        map_opts.buffer = nil
        vim.api.nvim_buf_set_keymap(buffer, mode, lhs, mapping, map_opts)
    end
end

function M.map(opts)
    return make_mapper('', { noremap = false, silent = true }, opts)
end

function M.noremap(opts)
    return make_mapper('', { noremap = true, silent = true }, opts)
end

function M.nmap(opts)
    return make_mapper('n', { noremap = false, silent = true }, opts)
end

function M.nnoremap(opts)
    return make_mapper('n', { noremap = true, silent = true }, opts)
end

function M.imap(opts)
    return make_mapper('i', { noremap = false, silent = true }, opts)
end

function M.inoremap(opts)
    return make_mapper('i', { noremap = true, silent = true }, opts)
end

function M.tmap(opts)
    return make_mapper('t', { noremap = false, silent = true }, opts)
end

function M.tnoremap(opts)
    return make_mapper('t', { noremap = true, silent = true }, opts)
end

function M.vmap(opts)
    return make_mapper('v', { noremap = false, silent = true }, opts)
end

function M.vnoremap(opts)
    return make_mapper('v', { noremap = true, silent = true }, opts)
end

function M.smap(opts)
    return make_mapper('s', { noremap = false, silent = true }, opts)
end

function M.snoremap(opts)
    return make_mapper('s', { noremap = true, silent = true }, opts)
end

return M
