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

local colors = {
    ylw = {
        hsl('#FBEC9F'),
        hsl('#DBC08A'),
        hsl('#F4D554'),
    },
    grn = {
        hsl('#99C794'),
        hsl('#9DD067'),
        hsl('#1ABC9C'),
    },
    red = {
        hsl('#F75f5F'),
        hsl('#F92772'),
        hsl('#DC1874'),
    },
    blu = {
        hsl('#7BA1D0'),
        hsl('#18C6C3'),
        hsl('#001423'),
    },
    prp = {
        hsl('#9E71CF'),
        hsl('#23064D'),
        hsl('#200020'),
    },
    gry = {
        hsl('#AABACF'),
        hsl('#777F9F'),
        hsl('#4f4f5E')
    },
    wht = hsl('#FAFAFA'),
}

local theme = lush(function()
  return {
    Comment      { fg = colors.red[2], gui = 'italic' },
    ColorColumn  { bg = colors.gry[3] },

    DiffAdd      { fg = colors.grn[2] },
    DiffChange   { fg = colors.prp[1] },
    DiffDelete   { fg = colors.red[1], gui = 'strikethrough'},
    DiffText     { fg = colors.blu[3], bg = colors.grn[3], gui = 'bold' },


    MoreMsg      { fg = colors.grn[3] },
    ErrorMsg     { fg = colors.red[2], gui = 'bold' },
    WarningMsg   { fg = colors.ylw[1] },

    Question     { MoreMsg },
    Title        { Question, gui = 'bold,italic' },

    Folded       { fg = colors.blu[1] , bg = colors.gry[3], gui = 'bold,italic' },

    VertSplit    { },
    FoldColumn   { },
    SignColumn   { },

    Visual       { fg = colors.ylw[2], bg = colors.prp[3] },
    IncSearch    { Visual },
    Substitute   { Visual },

    LineNr       { fg = colors.ylw[2] },
    CursorLineNr { fg = colors.blu[2] },

    MatchParen   { fg = colors.ylw[1], gui = 'undercurl' },

    NonText      { fg = colors.blu[2] },
    EndOfBuffer  { NonText },
    SpecialKey   { NonText },
    Whitespace   { NonText },

    Normal       { fg = colors.wht },
    NormalFloat  { Normal },
    Conceal      { Normal, bg = colors.gry[3] },

    Pmenu        { fg = colors.ylw[1], bg = colors.prp[2] },
    PmenuSel     { Pmenu, bg = colors.blu[3] },
    PmenuSbar    { fg = colors.gry[3], bg = colors.gry[3] },
    PmenuThumb   { fg = colors.prp[3], bg = colors.prp[3] },

    QuickFixLine { fg = colors.prp[3], bg = colors.ylw[1], gui = 'bold' },
    Search       { QuickFixLine },
    WildMenu     { QuickFixLine },

    -- Constant       { },
    -- String         { },
    -- Character      { },
    -- Number         { },
    -- Boolean        { },
    -- Float          { },

    -- Identifier     { },
    Function       { fg = colors.grn[3] },

    -- Statement      { },
    -- Conditional    { },
    -- Repeat         { },
    -- Label          { },
    -- Operator       { },
    -- Keyword        { },
    -- Exception      { },

    -- PreProc        { },
    -- Include        { },
    -- Define         { },
    -- Macro          { },
    -- PreCondit      { },

    -- Type           { },
    -- StorageClass   { },
    -- Structure      { },
    -- Typedef        { },

    -- Special        { },
    -- SpecialChar    { },
    -- Tag            { },
    -- Delimiter      { },
    -- SpecialComment { },
    -- Debug          { },

    Underlined { gui = "underline" },
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { },

    Error          { Normal, bg = ErrorMsg.fg },

    -- Todo           { },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { },
    -- LspReferenceRead                     { },
    -- LspReferenceWrite                    { },

    -- LspDiagnosticsDefaultError           { },
    -- LspDiagnosticsDefaultWarning         { },
    -- LspDiagnosticsDefaultInformation     { },
    -- LspDiagnosticsDefaultHint            { },

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

    -- TSAnnotation         { },
    -- TSAttribute          { },
    -- TSBoolean            { },
    -- TSCharacter          { },
    -- TSComment            { },
    -- TSConstructor        { },
    -- TSConditional        { },
    -- TSConstant           { },
    -- TSConstBuiltin       { },
    -- TSConstMacro         { },
    -- TSError              { },
    -- TSException          { },
    -- TSField              { },
    -- TSFloat              { },
    -- TSFunction           { },
    -- TSFuncBuiltin        { },
    -- TSFuncMacro          { },
    -- TSInclude            { },
    -- TSKeyword            { },
    -- TSKeywordFunction    { },
    -- TSLabel              { },
    -- TSMethod             { },
    -- TSNamespace          { },
    -- TSNone               { },
    -- TSNumber             { },
    -- TSOperator           { },
    -- TSParameter          { },
    -- TSParameterReference { },
    -- TSProperty           { },
    -- TSPunctDelimiter     { },
    -- TSPunctBracket       { },
    -- TSPunctSpecial       { },
    -- TSRepeat             { },
    -- TSString             { },
    -- TSStringRegex        { },
    -- TSStringEscape       { },
    -- TSSymbol             { },
    -- TSType               { },
    -- TSTypeBuiltin        { },
    -- TSVariable           { },
    -- TSVariableBuiltin    { },

    -- TSTag                { },
    -- TSTagDelimiter       { },
    -- TSText               { },
    -- TSEmphasis           { },
    -- TSUnderline          { },
    -- TSStrike             { },
    -- TSTitle              { },
    -- TSLiteral            { },
    -- TSURI                { },
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap

