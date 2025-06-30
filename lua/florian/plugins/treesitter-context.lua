return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPost",
  opts = {
    max_lines = 3,
    patterns = {
      vue = {
        'template',
        'script',
        'style',
        'method_definition',
        'function_declaration',
      },
    },
  },
}