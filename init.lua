-- Wrapper around require that reloads the given package every time
-- it is called.
--
---@param   path    string      The package's path. Use require syntax
---@return  any
function _G.import(path)
    package.loaded[path] = nil
    return require(path)
end

import 'config'
import 'plugins'
import 'snippet-defs'

vim.cmd [[colo aurora]]
