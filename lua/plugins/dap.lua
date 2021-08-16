require('dapui').setup()
vim.cmd [[au Filetype dap-repl lua require'dap.ext.autocompl'.attach()]]
