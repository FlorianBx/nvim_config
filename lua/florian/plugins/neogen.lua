-- auto documentation
-- https://github.com/danymat/neogen
return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  config = function()
    require('neogen').setup({
      enabled = true,
      languages = {
        typescript = {
          template = {
            annotation_convention = "tsdoc"
          }
        },
      }
    })
  end,
  keys = {
    { "<Leader>ng", function() require('neogen').generate() end, desc = "Generate documentation" },
  }
}
