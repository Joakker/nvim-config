local define = vim.fn.sign_define

-- stylua: ignore
local signs = {
    Error = '',
    Warn  = '',
    Info  = 'כֿ',
    Hint  = '',
}

for k, v in pairs(signs) do
    local name = 'DiagnosticSign' .. k
    define(name, { text = v, texthl = name })
end
