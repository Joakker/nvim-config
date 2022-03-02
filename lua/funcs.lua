function inspect() end

function import(path)
    package.loaded[path] = nil
    return require(path)
end

function partial(f, ...)
    local args = { ... }
    return function()
        return f(unpack(args))
    end
end
