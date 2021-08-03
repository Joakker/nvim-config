local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
        'git',
        'clone',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'hrsh7th/nvim-compe',
            'simrat39/rust-tools.nvim',
        },
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        requires = {},
        config = require 'plugins.tree-sitter',
    }
end)
