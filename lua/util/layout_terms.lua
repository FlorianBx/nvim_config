function OpenWindowWithTerminals()
  vim.cmd("split")
  vim.cmd("resize 12")
  vim.cmd("terminal")

  -- create 3 vertical splits
  for i = 2, 3 do
    vim.cmd("vsplit")
    vim.cmd("terminal")
    if i ~= 3 then
      vim.cmd("wincmd h")
    end
  end

  -- Back to the first terminal
  vim.cmd("wincmd h")
end

return {
  OpenWindowWithTerminals = OpenWindowWithTerminals,
}
