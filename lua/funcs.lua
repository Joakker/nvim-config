---@diagnostic disable: lowercase-global
---Reload the given module path before importing it again.
---@param path string The path to the module
function import(path)
    package.loaded[path] = nil
    return require(path)
end

---Return a no-args function that wraps the given one, called with the given vararg
---arguments.
---@param func function
---@return function
function partial(func, ...)
    local args = { ... }
    return function()
        return func(unpack(args))
    end
end

---Inspect the given args and print them to the console.
function put(...)
    local objects = {}
    for i = 1, select('#', ...) do
        local v = select(i, ...)
        table.insert(objects, vim.inspect(v))
    end
    print(table.concat(objects, '\n'))
end

---Find the given file either in this directory or in one of it's ancestors.
---@param name string
---@return string|nil
function find_ancestor(name)
    local Path = require 'plenary.path'
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
