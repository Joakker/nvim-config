---@diagnostic disable: unused-local, undefined-global
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
local lush = require 'lush'
local hsl = lush.hsl

local colors = {
    hsl '#B52A5B', --
    hsl '#FF4971', --
    hsl '#E9729D', --
    hsl '#F18FB0', --
    hsl '#F1C4E0', --
    hsl '#A8899C', --
    hsl '#2B59C3', --
    hsl '#8897F4', --
    hsl '#8DA9C4', --
    hsl '#468C98', --
    hsl '#00A9A5', --
    hsl '#AAEFDF', --
    hsl '#D08770', --
    hsl '#F1F18E', --
}

local theme = lush(function()
    return {
        VertSplit {}, --
        SignColumn {}, --
        --
        Comment {fg = colors[2], gui = 'italic'}, --
        ColorColumn {bg = colors[7]}, --
        LineNr {fg = colors[3]}, --
        CursorLineNr {fg = colors[8]}, --
        NonText {fg = colors[4].darken(60)}, --
        Normal {fg = colors[5]}, --
        Folded {Normal, bg = colors[1]}, --
        NormalFloat {Normal, bg = colors[1].darken(20)}, --
        Pmenu {NormalFloat}, --
        PmenuSel {fg = colors[4], bg = colors[1].darken(40)}, --
        PmenuSbar {fg = colors[4], bg = colors[4]}, --
        PmenuThumb {fg = colors[8], bg = colors[8]}, --
        QuickFixLine {fg = colors[14]}, --
        Search {bg = colors[14]}, --
        SpecialKey {fg = colors[9]}, --
        Title {fg = colors[5].rotate(20)}, --
        Visual {fg = colors[4].lighten(20), bg = colors[1].darken(20)}, --
        --
        Constant {fg = colors[13]}, --
        String {Constant, gui = 'bold,italic'}, --
        Character {fg = colors[13].lighten(50)}, --
        Number {fg = colors[8]}, --
        Boolean {fg = Constant.fg.rotate(70)}, --
        --
        Identifier {fg = colors[3]}, --
        Function {fg = colors[11], gui = 'italic'}, --
        --
        Statement {fg = colors[2]}, --
        Conditional {fg = colors[8]}, --
        Repeat {fg = colors[10]}, --
        -- Label          { }, --
        -- Operator       { }, --
        -- Keyword        { }, --
        -- Exception      { }, --
        --
        PreProc {fg = colors[1].lighten(30)}, --
        -- Include        { }, --
        -- Define         { }, --
        -- Macro          { }, --
        -- PreCondit      { }, --
        --
        Type {fg = colors[14]}, --
        -- StorageClass   { }, --
        -- Structure      { }, --
        -- Typedef        { }, --
        --
        Special {fg = colors[13].rotate(20)}, --
        -- SpecialChar    { }, --
        -- Tag            { }, --
        -- Delimiter      { }, --
        -- SpecialComment { }, --
        -- Debug          { }, --
        --
        Error {fg = colors[1].lighten(40), gui = 'underline'}, --
        --
        Todo {fg = colors[14], gui = 'bold'}, --
        ErrorMsg {fg = colors[2], gui = 'underline'}, --
        WarningMsg {fg = colors[13], gui = 'underline'}, --
        --
        LspReferenceText {fg = colors[1], bg = colors[5], gui = 'bold'}, --
        LspReferenceRead {LspReferenceText}, --
        LspReferenceWrite {LspReferenceText}, --
        --
        LspDiagnosticsDefaultError {ErrorMsg}, --
        LspDiagnosticsDefaultWarning {WarningMsg}, --
        LspDiagnosticsDefaultInformation {fg = colors[8]}, --
        LspDiagnosticsDefaultHint {fg = colors[9]}, --
        --
        LspDiagnosticsUnderlineError {
            LspDiagnosticsDefaultError,
            gui = 'underline',
        }, LspDiagnosticsUnderlineWarning {
            LspDiagnosticsDefaultWarning,
            gui = 'underline',
        }, LspDiagnosticsUnderlineInformation {
            LspDiagnosticsDefaultInformation,
            gui = 'underline',
        },
        LspDiagnosticsUnderlineHint {
            LspDiagnosticsDefaultHint,
            gui = 'underline',
        }, --
        LspDiagnosticsSignError {LspDiagnosticsDefaultError, gui = ''}, --
        LspDiagnosticsSignWarning {LspDiagnosticsDefaultWarning, gui = ''}, --
        --
        TSAnnotation {fg = colors[8].darken(10)}, --
        -- TSAttribute          { },    --
        -- TSBoolean            { },    --
        -- TSCharacter          { },    --
        -- TSComment            { },    --
        -- TSConstructor        { },    --
        -- TSConditional        { },    --
        -- TSConstant           { },    --
        -- TSConstBuiltin       { },    --
        -- TSConstMacro         { },    --
        -- TSError              { },    --
        -- TSException          { },    --
        -- TSField              { },    --
        -- TSFloat              { },    --
        -- TSFunction           { },    --
        -- TSFuncBuiltin        { },    --
        -- TSFuncMacro          { },    --
        -- TSInclude            { },    --
        -- TSKeyword            { },    --
        -- TSKeywordFunction    { },    --
        -- TSLabel              { },    --
        -- TSMethod             { },    --
        -- TSNamespace          { },    --
        -- TSNone               { },    --
        -- TSNumber             { },    --
        -- TSOperator           { },    --
        -- TSParameter          { },    --
        -- TSParameterReference { },    --
        -- TSProperty           { },    --
        -- TSPunctDelimiter     { },    --
        -- TSPunctBracket       { },    --
        -- TSPunctSpecial       { },    --
        -- TSRepeat             { },    --
        -- TSString             { },    --
        -- TSStringRegex        { },    --
        -- TSStringEscape       { },    --
        -- TSSymbol             { },    --
        -- TSType               { },    --
        -- TSTypeBuiltin        { },    --
        -- TSVariable           { },    --
        -- TSVariableBuiltin    { },    --
        -- TSTag                { },    --
        -- TSTagDelimiter       { },    --
        -- TSText               { },    --
        -- TSEmphasis           { },    --
        -- TSUnderline          { },    --
        -- TSStrike             { },    --
        -- TSTitle              { },    --
        -- TSLiteral            { },    --
        -- TSURI                { },    --
    }
end)

lush(theme)

return theme
