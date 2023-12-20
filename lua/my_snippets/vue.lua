local ls = require("luasnip")

ls.snippets = {
  vue = {
    ls.s("vuebase", {
      ls.t('<script setup lang="ts">\n'),
      ls.i(1),
      ls.t("\n</script>\n\n<template>\n  "),
      ls.i(2),
      ls.t("\n</template>"),
    }),
  },
}
