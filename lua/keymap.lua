_G.__mapping_rhs = _G.__mapping_rhs or {}
_G.__mapping_exp = function(nr)
    return __mapping_rhs[nr]()
end

local cmd = [[<CMD>lua __mapping_exp(%s)<CR>]]
local exp = [[v:lua.__mapping_exp(%s)<CR>]]

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
            'if `rhs` is a function, `noremap` must be true'
        )
        local func_id = insert(rhs)
        if map_opts.expr then
            mapping = exp:format(func_id)
        else
            mapping = cmd:format(func_id)
        end
    else
        error('Unexpected type for rhs: ' .. tostring(rhs))
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

local no_def = { noremap = true, silent = true }
local re_def = { noremap = false, silent = true }

local function map(opts)
    return make_mapper('', re_def, opts)
end
local function noremap(opts)
    return make_mapper('', no_def, opts)
end
local function nmap(opts)
    return make_mapper('n', re_def, opts)
end
local function nnoremap(opts)
    return make_mapper('n', no_def, opts)
end
local function imap(opts)
    return make_mapper('i', re_def, opts)
end
local function inoremap(opts)
    return make_mapper('i', no_def, opts)
end
local function smap(opts)
    return make_mapper('s', re_def, opts)
end
local function snoremap(opts)
    return make_mapper('s', no_def, opts)
end
local function tmap(opts)
    return make_mapper('t', re_def, opts)
end
local function tnoremap(opts)
    return make_mapper('t', no_def, opts)
end
local function vmap(opts)
    return make_mapper('v', re_def, opts)
end
local function vnoremap(opts)
    return make_mapper('v', no_def, opts)
end

return {
    map = map,
    nmap = nmap,
    imap = imap,
    smap = smap,
    tmap = tmap,
    vmap = vmap,
    noremap = noremap,
    nnoremap = nnoremap,
    inoremap = inoremap,
    snoremap = snoremap,
    tnoremap = tnoremap,
    vnoremap = vnoremap,
}
