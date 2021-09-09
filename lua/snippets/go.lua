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
        t 'func ', i(1, 'Name'), t '(', i(2), t ')', i(3), t { '{', '' },
            t '\t', i(0),
        t { '', '}' }
    }),
    s('meth', {
        t 'func (', i(1, 'Type'), t ') ', i(2, 'Name'), t '(', i(2), t ')', i(3), t { '{', '' },
            t '\t', i(0),
        t { '', '}' }
    })
}
