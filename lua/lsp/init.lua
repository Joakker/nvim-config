import 'lsp.setup'

for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/lsp/servers/*', true)) do
    dofile(file)
end
