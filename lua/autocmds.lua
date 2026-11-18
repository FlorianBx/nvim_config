require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "TermLeave" }, {
  callback = function()
    if vim.fn.getcmdwintype() == "" and vim.bo.buftype == "" then
      vim.cmd.checktime()
    end
  end,
})
