local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local vue_group = augroup("VueConfig", { clear = true })
local typescript_group = augroup("TypeScriptConfig", { clear = true })
local general_group = augroup("GeneralConfig", { clear = true })


autocmd("FileType", {
  pattern = "vue",
  group = vue_group,
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
  end,
})

autocmd("FileType", {
  pattern = { "typescript", "javascript" },
  group = typescript_group,
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
    vim.bo.softtabstop = 2
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

