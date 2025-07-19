return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('render-markdown').setup({
            enabled = false,
        })
        
        vim.keymap.set('n', '<leader>md', function()
            require('render-markdown').toggle()
        end, { desc = 'Toggle markdown preview' })
    end,
}
