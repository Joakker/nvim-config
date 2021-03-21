local cmd = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    cmd('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

return require'packer'.startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require'plugins.treesitter' end
    }
end)
