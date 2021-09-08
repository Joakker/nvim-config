import 'lsp.cmp'
import 'lsp.pairs'
import 'lsp.gui'

vim.lsp.set_log_level 'error'

for _, file in ipairs(vim.api.nvim_get_runtime_file('lua/lsp/servers/*', true)) do
    dofile(file)
end
