local luasnip = require 'luasnip'

local s = luasnip.s
local i = luasnip.i
local t = luasnip.t

-- stylua: ignore
return {
    s('func', {
        t 'function ', i(1), t '(', i(2), t { ')', '' },
            t '\t', i(0),
        t { '', 'end' },
    }),
    s('if', {
        t'if ', i(1), t'then',
            t '\t', i(0),
        t'end',
    }),
    s('fori', {
        t 'for ', i(1, 'i'), t ' = ', i(2, '1, 10'), t { ' do', '' },
            t '\t', i(0),
        t { '', 'end' }
    }),
    s('for', {
        t 'for ', i(1, 'k, v'), t ' in ', i(2, 'pairs {}'), t { ' do ', '' },
            t '\t', i(0),
        t { '', 'end' }
    }),
}
