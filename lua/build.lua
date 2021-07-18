local M = {}
local Path = require 'plenary.path'
local Job = require 'plenary.job'

-- Finds the path of 'file' in the ancestors of the current directory. Returns
-- the directory that was found to contain 'file', in Path form
---@param file  string   The relative path of the file
---@return table|nil
function M.find_parents(file)
    local cur = Path:new(vim.loop.cwd())
    if (cur / file):exists() then
        return cur
    end
    for _, path in ipairs(cur:parents()) do
        local test_path = Path:new(path)
        if (test_path / file):exists() then
            return test_path
        end
    end
    return nil
end

M.filetypes = { ['latex'] = ':TexlabBuild' }

M.conditions = {
    ['Makefile'] = 'make',
    ['go.mod'] = { 'go', args = { 'build' } },
    ['Cargo.toml'] = { 'cargo', args = { 'build' } },
    ['tsconfig.json'] = 'tsc',
}

function M.build()
    for k, v in pairs(M.conditions) do
        local test_path = M.find_parents(k)
        if test_path then
            local cmd
            local args
            if type(v) == 'string' then
                if v:sub(1, 1) == ':' then
                    vim.cmd(v)
                    return
                end
                cmd = v
            elseif type(v) == 'table' then
                cmd = v[1]
                args = v.args
            else
                print(
                    'build.lua: Invalid command for condition:' .. k .. '🧐'
                )
                return
            end
            Job
                :new({
                    command = cmd,
                    args = args,
                    cwd = test_path.filepath,
                    on_exit = function(_, return_val)
                        if return_val ~= 0 then
                            print [[build.lua: Exited with nonzero code 😨]]
                        else
                            print [[build.lua: Success! 😎]]
                        end
                    end,
                })
                :sync()
            return
        end
    end
    local cmd = M.filetypes[vim.bo.filetype]
    if cmd then
        vim.cmd(cmd)
        return
    end
    print [[build.lua: No build conditions were found 😢]]
end

return M
