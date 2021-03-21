function _G.import(path)
    package.loaded[path] = nil
    return require(path)
end


import 'config'
import 'plugins'
import 'snippet-defs'

vim.cmd [[colo aurora]]
