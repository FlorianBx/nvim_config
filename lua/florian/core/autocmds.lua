local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local vue_group = augroup("VueConfig", { clear = true })
local typescript_group = augroup("TypeScriptConfig", { clear = true })
local general_group = augroup("GeneralConfig", { clear = true })

local function is_in_node_modules()
  local filepath = vim.fn.expand("%:p")
  return filepath:match("node_modules") ~= nil
end

local function is_large_file()
  local filepath = vim.fn.expand("%:p")
  local stat = vim.loop.fs_stat(filepath)
  return stat and stat.size > 100000
end

local function should_format()
  return not is_in_node_modules() and not is_large_file()
end

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

autocmd("BufWritePre", {
  pattern = { "*.vue", "*.ts", "*.js" },
  group = general_group,
  callback = function()
    if should_format() then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

autocmd("BufEnter", {
  pattern = "*.vue",
  group = vue_group,
  callback = function()
    vim.cmd("set filetype=vue")
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

autocmd("VimEnter", {
  group = general_group,
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      vim.defer_fn(function()
        vim.cmd.cd(data.file)
        require("neo-tree.command").execute({ action = "show" })
      end, 200)
    end
  end,
})

