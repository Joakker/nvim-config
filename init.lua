require 'funcs'

-- If plugins aren't installed, do that now before everything else
local ok = import 'plugins'
if not ok then
    require('packer').sync()
end

import 'snippets'

import 'lsp'
import 'config.mappings'
import 'config.options'
import 'config.provider'

vim.g.tokyonight_style = 'night'
vim.cmd [[ colo tokyonight ]]
