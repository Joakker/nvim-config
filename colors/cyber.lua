---@diagnostic disable: undefined-global
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
local lush = require('lush')
---@type function(string)
local hsl = lush.hsl

local colors = {
    -- Reds
    red1 = hsl '#D36582',
    red2 = hsl '#DB4C40',

    -- Greens
    grn1 = hsl '#80AD85',
    grn2 = hsl '#109587',

    -- Purples
    prp1 = hsl '#170312',
    prp2 = hsl '#33032F',

    -- Oranges
    ora1 = hsl '#C18C5D',

    -- Blues
    blu1 = hsl '#28666E',

    -- Whites
    wht1 = hsl '#D2D6EF',
}

local theme = lush(function()
    return {
        Comment {fg = colors.red1, gui = 'italic'}, -- any comment
        ColorColumn {bg = colors.prp1}, -- used for the columns set with 'colorcolumn'
        -- Directory    { }, -- directory names (and other special names in listings)
        VertSplit {}, -- the column separating vertically split windows
        SignColumn {}, -- column where |signs| are displayed
        -- LineNr       { }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
        -- CursorLineNr { }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
        -- MatchParen   { }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
        -- MsgArea      { }, -- Area for messages and cmdline
        -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
        -- MoreMsg      { }, -- |more-prompt|
        Normal {fg = colors.wht1}, -- normal text
        NormalFloat {Normal}, -- Normal text in floating windows.
        Conceal {Normal}, -- placeholder characters substituted for concealed text (see 'conceallevel')
        Folded {Normal}, -- line used for closed folds
        FoldColumn {Normal}, -- 'foldcolumn'
        NonText {fg = colors.blu1}, SpecialKey {NonText}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
        -- Pmenu        { }, -- Popup menu: normal item.
        -- PmenuSel     { }, -- Popup menu: selected item.
        -- PmenuSbar    { }, -- Popup menu: scrollbar.
        -- PmenuThumb   { }, -- Popup menu: Thumb of the scrollbar.
        -- Question     { }, -- |hit-enter| prompt and yes/no questions
        -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
        -- Title        { }, -- titles for output from ":set all", ":autocmd" etc.
        Visual {bg = colors.prp1}, -- Visual mode selection
        Search {Visual}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
        IncSearch {Visual, fg = colors.red1}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
        Substitute {Visual}, -- |:substitute| replacement text highlighting
        -- WarningMsg   { }, -- warning messages
        -- WildMenu     { }, -- current match in 'wildmenu' completion
        -- Constant       { }, -- (preferred) any constant
        String {fg = colors.ora1, gui = 'italic'}, --   a string constant: "this is a string"
        -- Character      { }, --  a character constant: 'c', '\n'
        -- Number         { }, --   a number constant: 234, 0xff
        -- Boolean        { }, --  a boolean constant: TRUE, false
        -- Float          { }, --    a floating point constant: 2.3e10
        -- Identifier     { }, -- (preferred) any variable name
        Function {fg = colors.grn2, gui = 'italic'}, -- function name (also: methods for classes)

        -- Statement      { }, -- (preferred) any statement
        -- Conditional    { }, --  if, then, else, endif, switch, etc.
        -- Repeat         { }, --   for, do, while, etc.
        -- Label          { }, --    case, default, etc.
        -- Operator       { }, -- "sizeof", "+", "*", etc.
        -- Keyword        { }, --  any other keyword
        -- Exception      { }, --  try, catch, throw

        -- PreProc        { }, -- (preferred) generic Preprocessor
        -- Include        { }, --  preprocessor #include
        -- Define         { }, --   preprocessor #define
        -- Macro          { }, --    same as Define
        -- PreCondit      { }, --  preprocessor #if, #else, #endif, etc.

        -- Type           { }, -- (preferred) int, long, char, etc.
        -- StorageClass   { }, -- static, register, volatile, etc.
        -- Structure      { }, --  struct, union, enum, etc.
        -- Typedef        { }, --  A typedef

        -- Special        { }, -- (preferred) any special symbol
        -- SpecialChar    { }, --  special character in a constant
        -- Tag            { }, --    you can use CTRL-] on this
        -- Delimiter      { }, --  character that needs attention
        -- SpecialComment { }, -- special things inside a comment
        -- Debug          { }, --    debugging statements

        -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

        Error {fg = colors.red2, gui = 'bold,italic,underline'}, -- (preferred) any erroneous construct
        ErrorMsg {Error}, -- error messages on the command line

        -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- LspReferenceText                     { }, -- used for highlighting "text" references
        -- LspReferenceRead                     { }, -- used for highlighting "read" references
        -- LspReferenceWrite                    { }, -- used for highlighting "write" references

        -- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        -- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        -- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
        -- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

        -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
        -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
        -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
        -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

        -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
        -- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
        -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
        -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

        -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
        -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

        -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
        -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
        -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
        -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

        -- TSAnnotation         { };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
        -- TSAttribute          { };    -- (unstable) TODO: docs
        -- TSBoolean            { };    -- For booleans.
        -- TSCharacter          { };    -- For characters.
        -- TSComment            { };    -- For comment blocks.
        -- TSConstructor        { };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
        -- TSConditional        { };    -- For keywords related to conditionnals.
        -- TSConstant           { };    -- For constants
        -- TSConstBuiltin       { };    -- For constant that are built in the language: `nil` in Lua.
        -- TSConstMacro         { };    -- For constants that are defined by macros: `NULL` in C.
        -- TSError              { };    -- For syntax/parser errors.
        -- TSException          { };    -- For exception related keywords.
        -- TSField              { };    -- For fields.
        -- TSFloat              { };    -- For floats.
        -- TSFunction           { };    -- For function (calls and definitions).
        -- TSFuncBuiltin        { };    -- For builtin functions: `table.insert` in Lua.
        -- TSFuncMacro          { };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        -- TSInclude            { };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        -- TSKeyword            { };    -- For keywords that don't fall in previous categories.
        -- TSKeywordFunction    { };    -- For keywords used to define a fuction.
        -- TSLabel              { };    -- For labels: `label:` in C and `:label:` in Lua.
        -- TSMethod             { };    -- For method calls and definitions.
        -- TSNamespace          { };    -- For identifiers referring to modules and namespaces.
        -- TSNone               { };    -- TODO: docs
        -- TSNumber             { };    -- For all numbers
        -- TSOperator           { };    -- For any operator: `+`, but also `->` and `*` in C.
        -- TSParameter          { };    -- For parameters of a function.
        -- TSParameterReference { };    -- For references to parameters of a function.
        -- TSProperty           { };    -- Same as `TSField`.
        -- TSPunctDelimiter     { };    -- For delimiters ie: `.`
        -- TSPunctBracket       { };    -- For brackets and parens.
        -- TSPunctSpecial       { };    -- For special punctutation that does not fall in the catagories before.
        -- TSRepeat             { };    -- For keywords related to loops.
        -- TSString             { };    -- For strings.
        -- TSStringRegex        { };    -- For regexes.
        -- TSStringEscape       { };    -- For escape characters within a string.
        -- TSSymbol             { };    -- For identifiers referring to symbols or atoms.
        -- TSType               { };    -- For types.
        -- TSTypeBuiltin        { };    -- For builtin types.
        -- TSVariable           { };    -- Any variable name that does not have another highlight.
        -- TSVariableBuiltin    { };    -- Variable names that are defined by the languages, like `this` or `self`.

        -- TSTag                { };    -- Tags like html tag names.
        -- TSTagDelimiter       { };    -- Tag delimiter like `<` `>` `/`
        -- TSText               { };    -- For strings considered text in a markup language.
        -- TSEmphasis           { };    -- For text to be represented with emphasis.
        -- TSUnderline          { };    -- For text to be represented with an underline.
        -- TSStrike             { };    -- For strikethrough text.
        -- TSTitle              { };    -- Text that is part of a title.
        -- TSLiteral            { };    -- Literal text.
        -- TSURI                { };    -- Any URI like a link or email.

    }
end)

-- return our parsed theme for extension or use else where.
return lush(theme)

-- vi:nowrap

