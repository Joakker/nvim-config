local luasnip = require 'luasnip'

local s = luasnip.s
local i = luasnip.i
local t = luasnip.t

-- stylua: ignore
return {
    s('tyi', {
        t 'type ', i(1, 'Name'), t { ' interface {', '' },
            t '\t', i(0),
        t { '', '}' }
    }),
    s('tys', {
        t 'type ', i(1, 'Name'), t { ' struct {', '' },
            t '\t', i(0),
        t { '', '}' }
    }),

    s('func', {
        t 'func ', i(1, 'Name'), t '(', i(2), t ')', i(3), t { ' {', '' },
            t '\t', i(0),
        t { '', '}' }
    }),
    s('meth', {
        t 'func (', i(1, 'Type'), t ') ', i(2, 'Name'), t '(', i(3), t ')', i(4), t { ' {', '' },
            t '\t', i(0),
        t { '', '}' }
    }),

    s('if', {
        t 'if ', i(1, 'true'), t { ' {', '' },
            t '\t', i(0),
        t { '', '}' }
    }),

    s('fori', {
        t 'for ', i(1, 'i := 0'), t ';', i(2, 'i < 10'), t ';', i(3, 'i++'), t { ' {', '' },
            t '\t', i(0),
        t { '', '}' }
    }),
    s('for', {
        t 'for ', i(1, 'k, v'), t ' := range ', i(2, 'expr'), t { ' {', '' },
            t '\t', i(0),
        t { '', '}' }
    })
}
