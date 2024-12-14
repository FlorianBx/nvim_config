function eslint_fix_and_refresh()
    vim.cmd('write')
    vim.fn.CocAction('runCommand', 'eslint.executeAutofix')
    vim.cmd('e!')
    vim.fn.CocAction('diagnosticRefresh')
    
    vim.notify('ESLint fixes applied and diagnostics refreshed', vim.log.levels.INFO)
end

return {
    eslint_fix_and_refresh = eslint_fix_and_refresh
}
