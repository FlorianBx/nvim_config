return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    
    vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion"
    })
    
    vim.keymap.set("i", "<C-]>", "copilot#Dismiss()", {
      expr = true,
      desc = "Dismiss Copilot suggestion"
    })
    
    vim.keymap.set("i", "<C-\\>", "copilot#Next()", {
      expr = true,
      desc = "Next Copilot suggestion"
    })
    
    vim.keymap.set("i", "<C-[>", "copilot#Previous()", {
      expr = true,
      desc = "Previous Copilot suggestion"
    })
  end,
}
