local M = {}

function M.setup()
  local keyset = vim.keymap.set

  -- Vue specific keymaps
  keyset("n", "<leader>vi", ":CocCommand vue.inspectTemplate<CR>", { silent = true, desc = "Inspect template" })
  keyset("n", "<leader>vt", ":CocCommand vue.templateToSetup<CR>", { silent = true, desc = "Template to setup" })
  keyset("n", "<leader>vs", ":CocCommand vue.splitEditors<CR>", { silent = true, desc = "Split editors" })
  
  -- Snippets Vue
  vim.g.coc_user_snippets = {
    vue = {
      ['setup'] = '<script setup lang="ts">\n${1}\n</script>\n\n<template>\n\t${2}\n</template>\n\n<style scoped>\n${3}\n</style>',
      ['ref'] = 'const ${1} = ref(${2})',
      ['computed'] = 'const ${1} = computed(() => ${2})',
      ['watch'] = 'watch(${1}, (new${1}, old${1}) => {\n\t${2}\n})',
      ['props'] = 'const props = defineProps<{\n\t${1}: ${2}\n}>()',
      ['emit'] = 'const emit = defineEmits<{\n\t${1}: [${2}]\n}>()',
    }
  }

  -- Auto-import configurations pour Vue
  vim.g.coc_vue_import_on_completion = true
end

return M
