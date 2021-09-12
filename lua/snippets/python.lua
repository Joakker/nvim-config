local luasnip = require 'luasnip'

local s = luasnip.s
local i = luasnip.i
local t = luasnip.t

-- stylua: ignore
return {
    s('def', {
        t 'def ', i(1, 'name'), t '(', i(2), t ') -> ', i(3, 'None'), t { ':', '' },
            t '\t', i(0, 'pass')
    }),

    s('for', {
        t 'for ', i(1, 'i'), t ' in ', i(2, 'range(10)'), t { ':', '' },
            t '\t', i(0, 'pass')
    }),
    s('while', {
        t 'while ', i(1, 'True'), t { ':', '' },
            t '\t', i(0, 'pass')
    }),

    s('if', {
        t 'if ', i(1, 'True'), t { ':', '' },
            t '\t', i(0, 'pass')
    })
}
