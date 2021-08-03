local function on_attach(client, bufnr)
    if client.resolved_capabilities.document_formatting then
        vim.cmd [[
	augroup lsp_formatting
		autocmd! * <buffer>
		autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	augroup END
	]]
    end
end
return {
    on_attach = on_attach,
    server_dir = vim.fn.stdpath 'data' .. '/servers/',
}
