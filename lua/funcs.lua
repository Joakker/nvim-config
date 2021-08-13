local Path = require 'plenary.path'

---Wrapper around require that reloads the module at the given path before
---returning it.
---
---@param  path string  The package's path
---@return any
function _G.import(path)
    package.loaded[path] = nil
    return require(path)
end

---Wrapper around vim.inspect that automatically prints the inspected arguments.
function _G.inspect(...)
    for _, v in ipairs { ... } do
        print(vim.inspect(v))
    end
end

---Returns the path to the named file either in this directory or in one
---of it's ancestors. If no file is found, return nil.
---
---@param  name string     The file we're checking for
---@return      string|nil
function _G.find_ancestor(name)
    local cur = Path:new(vim.loop.cwd())
    local test_path = cur / name
    if test_path:exists() then
        return test_path:absolute()
    end
    for _, parent in ipairs(cur:parents()) do
        test_path = Path:new(parent) / name
        if test_path:exists() then
            return test_path:absolute()
        end
    end
    return nil
end
