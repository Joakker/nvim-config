-- Wrapper around require that reloads the given package every time
-- it is called.
--
---@param   path    string      The package's path. Use require syntax
---@return  any
function _G.import(path)
    package.loaded[path] = nil
    return require(path)
end

-- Wrapper around vim.inspect so that it prints the result
--
---@param   object  any         The object to be inspected
function _G.inspect(object)
    print(vim.inspect(object))
end

import 'config'
import 'plugins'
import 'snippet-defs'

vim.cmd [[colo aurora]]
