local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    keymap.set('t', '<Esc>', '<C-\\><C-n>', keymapOptionsWithDesc("Exit terminal mode"))

    keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', keymapOptionsWithDesc("Move to left split from terminal"))
    keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', keymapOptionsWithDesc("Move to bottom split from terminal"))
    keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', keymapOptionsWithDesc("Move to top split from terminal"))
    keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', keymapOptionsWithDesc("Move to right split from terminal"))

    keymap.set('t', '<S-j>', '<Up>', keymapOptionsWithDesc("Shell history up"))
    keymap.set('t', '<S-k>', '<Down>', keymapOptionsWithDesc("Shell history down"))

    keymap.set('n', '<C-h>', '<C-w>h', keymapOptionsWithDesc("Move to left split"))
    keymap.set('n', '<C-j>', '<C-w>j', keymapOptionsWithDesc("Move to bottom split"))
    keymap.set('n', '<C-k>', '<C-w>k', keymapOptionsWithDesc("Move to top split"))
    keymap.set('n', '<C-l>', '<C-w>l', keymapOptionsWithDesc("Move to right split"))

    keymap.set('n', 'i', 'i', keymapOptionsWithDesc("Enter insert mode in terminal"))
    keymap.set('n', 'a', 'a', keymapOptionsWithDesc("Enter insert mode after cursor in terminal"))
    keymap.set('n', 'I', 'I', keymapOptionsWithDesc("Enter insert mode at line start in terminal"))
    keymap.set('n', 'A', 'A', keymapOptionsWithDesc("Enter insert mode at line end in terminal"))

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.cmd('startinsert')
  end,
})

return {}
