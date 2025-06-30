return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  event = "LspAttach",
  config = function()
    require("lsp_lines").setup()
    
    -- Ensure error colors are correct
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#f38ba8", bg = "NONE" })
    vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fab387", bg = "NONE" })
    
    -- Toggle with keymap
    vim.keymap.set("n", "<Leader>dl", require("lsp_lines").toggle, { desc = "Toggle LSP Lines" })
  end,
}