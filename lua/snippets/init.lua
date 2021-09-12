local ls = require 'luasnip'

ls.snippets = {
    all = {},
    lua = require 'snippets.lua',
    go = require 'snippets.go',
    python = require 'snippets.python',
    cs = require 'snippets.cs',
}
