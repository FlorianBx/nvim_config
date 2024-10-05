function eslint_fix_and_refresh()
    -- Save the current buffer
    vim.cmd('write')
    
    -- Execute ESLint
    local eslint_cmd = 'eslint --fix ' .. vim.fn.shellescape(vim.fn.expand('%:p'))
    vim.fn.system(eslint_cmd)
    
    -- Reload the buffer
    vim.cmd('e!')
    
		-- vim.lsp.diagnostic.refresh()
    vim.diagnostic.reset()
    for _, client in pairs(vim.lsp.get_active_clients()) do
        if client.supports_method("textDocument/diagnostic") then
            client.request("textDocument/diagnostic", {
                textDocument = vim.lsp.util.make_text_document_params()
            }, function(err, result)
                if err then return end
                vim.lsp.diagnostic.on_publish_diagnostics(
                    nil,
                    vim.tbl_extend("keep", params, { diagnostics = result.diagnostics }),
                    { client_id = client.id }
                )
            end)
        end
    end
    
    vim.notify('ESLint fixes applied and diagnostics refreshed', vim.log.levels.INFO)
end

return {
    eslint_fix_and_refresh = eslint_fix_and_refresh
}
