local define = vim.fn.sign_define

-- stylua: ignore
local signs = {
    Error       = '',
    Warning     = '',
    Information = 'כֿ',
    Hint        = '',
}

for k, v in pairs(signs) do
    local name = 'LspDiagnosticsSign' .. k
    define(name, { text = v, texthl = name })
end
