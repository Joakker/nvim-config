---@diagnostic disable: undefined-global
--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

local lush = require 'lush'
local hsl = lush.hsl

-- stylua: ignore
local colors = {
    pink       = hsl '#EB4B98',
    magenta    = hsl '#C678DD',
    crimson    = hsl '#DE3C4B',
    red        = hsl '#912F40',
    blue       = hsl '#035E7B',
    green      = hsl '#02394A',
    background = hsl '#202328',
    artic      = hsl '#E3E7AF',
    orange     = hsl '#FF8864',
}

local theme = lush(function()
    -- stylua: ignore
    return {
        Comment      { fg = colors.red.li(40), gui = 'italic' },

        ColorColumn  { bg = colors.blue.da(30) },
        Conceal      { ColorColumn },

        EndOfBuffer  { fg = colors.green.li(15) },
        Whitespace   { EndOfBuffer },
        Folded       { fg = colors.artic, bg = colors.background.li(30), gui = 'italic' },

        TablineFill  { fg = colors.artic, bg = colors.background },
        TablineSel   { fg = colors.artic, bg = colors.blue },
        Tabline      { fg = colors.artic, bg = colors.background.li(10) },

        StatusLine   { bg = colors.background },

        VertSplit    { },
        SignColumn   { },
        NonText      { },

        LineNr       { fg = colors.pink.ro(10), gui = 'bold' },
        CursorLineNr { LineNr },

        MatchParen   { fg = colors.crimson, bg = colors.blue.da(100) },

        Normal       { fg = colors.artic },
        NormalFloat  { Normal, bg = colors.background.da(40) },
        FloatBorder  { NormalFloat },
        MsgArea      { Normal },

        Pmenu        { fg = Normal.fg, bg = colors.blue },
        PmenuSel     { Pmenu, bg = Pmenu.bg.da(20) },
        PmenuSbar    { bg = colors.green },
        PmenuThumb   { bg = colors.artic },
        SpecialKey   { fg = colors.pink },

        Title        { fg = colors.magenta },

        Search       { fg = colors.crimson, bg = colors.blue.da(70) },
        IncSearch    { Search, fg = colors.magenta },
        Substitute   { Search, fg = colors.orange },
        WildMenu     { Search, fg = colors.blue  },
        QuickFixLine { Search, fg = colors.pink  },
        Visual       { Search, fg = colors.artic },

        ErrorMsg     { fg = colors.crimson, gui = 'bold' },
        WarningMsg   { fg = colors.artic.da(20), gui = 'bold' },

        Constant       { fg = colors.crimson.li(20) },
        String         { fg = colors.green.ro(-20).li(30), gui = 'italic' },
        Character      { fg = colors.orange },
        -- Number         { },
        Boolean        { Constant, gui = 'italic,bold' },
        -- Float          { },

        Identifier     { fg = colors.blue.li(30) },
        Function       { fg = colors.green.ro(-10).li(20), gui = 'italic' },

        Statement      { fg = colors.orange.li(20) },
        -- Conditional    { },
        Repeat         { fg = colors.magenta.ro(290).da(10) },
        -- Label          { },
        -- Operator       { },
        -- Keyword        { },
        -- Exception      { },

        PreProc        { fg = colors.orange.li(30) },
        Include        { fg = colors.orange.ro(-10) },
        -- Define         { },
        -- Macro          { },
        -- PreCondit      { },

        Type           { fg = colors.orange.ro(30) },
        -- StorageClass   { },
        -- Structure      { },
        -- Typedef        { },

        Special        { fg = colors.crimson.li(30) },
        -- SpecialChar    { },
        -- Tag            { },
        -- Delimiter      { },
        -- SpecialComment { },
        -- Debug          { },

        -- ("Ignore", below, may be invisible...)
        -- Ignore         { },

        -- Error          { },

        Todo           { fg = colors.artic.ro(20).da(10), gui = 'bold' },

        LspFloatWinNormal  { bg = colors.background.da(30) },
        LspSagaHoverBorder { bg = colors.background.da(30) },

        -- LspReferenceText                     { },
        -- LspReferenceRead                     { },
        -- LspReferenceWrite                    { },

        LspDiagnosticsDefaultError           { fg = colors.crimson },
        LspDiagnosticsDefaultWarning         { fg = colors.artic.da(20) },
        LspDiagnosticsDefaultInformation     { fg = colors.blue.li(20) },
        LspDiagnosticsDefaultHint            { fg = colors.green.ro(-40).li(30) },

        -- LspDiagnosticsVirtualTextError       { },
        -- LspDiagnosticsVirtualTextWarning     { },
        -- LspDiagnosticsVirtualTextInformation { },
        -- LspDiagnosticsVirtualTextHint        { },

        -- LspDiagnosticsUnderlineError         { },
        -- LspDiagnosticsUnderlineWarning       { },
        -- LspDiagnosticsUnderlineInformation   { },
        -- LspDiagnosticsUnderlineHint          { },

        -- LspDiagnosticsFloatingError          { },
        -- LspDiagnosticsFloatingWarning        { },
        -- LspDiagnosticsFloatingInformation    { },
        -- LspDiagnosticsFloatingHint           { },

        -- LspDiagnosticsSignError              { },
        -- LspDiagnosticsSignWarning            { },
        -- LspDiagnosticsSignInformation        { },
        -- LspDiagnosticsSignHint               { },

        -- TSAnnotation         { },    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        -- TSAttribute          { },    -- (unstable) TODO: docs
        -- TSBoolean            { },    -- For booleans.
        -- TSCharacter          { },    -- For characters.
        -- TSComment            { },    -- For comment blocks.
        -- TSConstructor        { },    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
        -- TSConditional        { },    -- For keywords related to conditionnals.
        -- TSConstant           { },    -- For constants
        -- TSConstBuiltin       { },    -- For constant that are built in the language: `nil` in Lua.
        -- TSConstMacro         { },    -- For constants that are defined by macros: `NULL` in C.
        TSError              { fg = colors.crimson, gui = 'bold,italic' },    -- For syntax/parser errors.
        -- TSException          { },    -- For exception related keywords.
        -- TSField              { },    -- For fields.
        -- TSFloat              { },    -- For floats.
        -- TSFunction           { },    -- For function (calls and definitions).
        -- TSFuncBuiltin        { },    -- For builtin functions: `table.insert` in Lua.
        -- TSFuncMacro          { },    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude            { },    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        -- TSKeyword            { },    -- For keywords that don't fall in previous categories.
        -- TSKeywordFunction    { },    -- For keywords used to define a fuction.
        -- TSLabel              { },    -- For labels: `label:` in C and `:label:` in Lua.
        -- TSMethod             { },    -- For method calls and definitions.
        -- TSNamespace          { },    -- For identifiers referring to modules and namespaces.
        -- TSNone               { },    -- TODO: docs
        -- TSNumber             { },    -- For all numbers
        -- TSOperator           { },    -- For any operator: `+`, but also `->` and `*` in C.
        -- TSParameter          { },    -- For parameters of a function.
        -- TSParameterReference { },    -- For references to parameters of a function.
        -- TSProperty           { },    -- Same as `TSField`.
        -- TSPunctDelimiter     { },    -- For delimiters ie: `.`
        -- TSPunctBracket       { },    -- For brackets and parens.
        -- TSPunctSpecial       { },    -- For special punctutation that does not fall in the catagories before.
        -- TSRepeat             { },    -- For keywords related to loops.
        -- TSString             { },    -- For strings.
        -- TSStringRegex        { },    -- For regexes.
        -- TSStringEscape       { },    -- For escape characters within a string.
        -- TSSymbol             { },    -- For identifiers referring to symbols or atoms.
        -- TSType               { },    -- For types.
        TSTypeBuiltin        { fg = colors.pink },    -- For builtin types.
        -- TSVariable           { },    -- Any variable name that does not have another highlight.
        -- TSVariableBuiltin    { },    -- Variable names that are defined by the languages, like `this` or `self`.

        -- TSTag                { },    -- Tags like html tag names.
        -- TSTagDelimiter       { },    -- Tag delimiter like `<` `>` `/`
        -- TSText               { },    -- For strings considered text in a markup language.
        -- TSEmphasis           { },    -- For text to be represented with emphasis.
        -- TSUnderline          { },    -- For text to be represented with an underline.
        -- TSStrike             { },    -- For strikethrough text.
        -- TSTitle              { },    -- Text that is part of a title.
        -- TSLiteral            { },    -- Literal text.
        -- TSURI                { },    -- Any URI like a link or email.
    }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
