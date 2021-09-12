local luasnip = require 'luasnip'

local s = luasnip.s
local i = luasnip.i
local t = luasnip.t

-- stylua: ignore
return {
    s('if', {
        t 'if (', i(1, 'true'), t ')', i(0)
    }),
}
