--@param path string    The package's path
function _G.import(path)
    package.loaded[path] = nil
    return require(path)
end

function _G.inspect(...)
    for _, v in ipairs { ... } do
        print(vim.inspect(v))
    end
end
