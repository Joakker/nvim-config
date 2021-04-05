lua << EOF
if require'utils'.has_parent(vim.loop.cwd(), 'plenary.nvim') then
    vim.cmd [[setl sw=2]]
end
EOF
