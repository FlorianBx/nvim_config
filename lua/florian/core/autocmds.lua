local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general_group = augroup("GeneralConfig", { clear = true })

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.vue",
  group = general_group,
  callback = function()
    vim.bo.filetype = "vue"
    vim.opt_local.updatetime = 500
    vim.defer_fn(function()
      vim.cmd("TSBufEnable highlight")
    end, 100)
  end,
})



autocmd("TextYankPost", {
  group = general_group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 200 })
  end,
})

autocmd("VimResized", {
  group = general_group,
  callback = function()
    vim.cmd("wincmd =")
  end,
})

