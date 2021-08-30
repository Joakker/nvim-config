import 'lsp.setup'
import 'lsp.compe'
import 'lsp.snippets'
import 'lsp.saga'

for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/lsp/servers/*', true)) do
    dofile(file)
end
