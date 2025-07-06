return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local luasnip = require("luasnip")
    
    require("luasnip.loaders.from_vscode").lazy_load()
    
    luasnip.config.setup({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
      ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
          active = {
            virt_text = { { "●", "Orange" } },
          },
        },
      },
    })

    local s = luasnip.snippet
    local t = luasnip.text_node
    local i = luasnip.insert_node
    local f = luasnip.function_node
    local c = luasnip.choice_node
    local d = luasnip.dynamic_node
    local sn = luasnip.snippet_node

    luasnip.add_snippets("vue", {
      s("vue3", {
        t("<script setup lang=\"ts\">"),
        t({"", ""}), i(1, "// component logic"),
        t({"", "</script>"}),
        t({"", ""}),
        t({"", "<template>"}),
        t({"", "  <div>"}),
        t({"", "    "}), i(2, "content"),
        t({"", "  </div>"}),
        t({"", "</template>"}),
      }),
      
      s("vref", {
        t("const "), i(1, "name"), t(" = ref"), c(2, {
          sn(nil, { t("<"), i(1, "T"), t(">("), i(2, "value"), t(")") }),
          sn(nil, { t("("), i(1, "value"), t(")") }),
        }),
      }),
      
      s("vreactive", {
        t("const "), i(1, "state"), t(" = reactive"), c(2, {
          sn(nil, { t("<"), i(1, "T"), t(">("), i(2, "{}"), t(")") }),
          sn(nil, { t("("), i(1, "{}"), t(")") }),
        }),
      }),
      
      s("vcomputed", {
        t("const "), i(1, "computed"), t(" = computed"), c(2, {
          sn(nil, { t("<"), i(1, "T"), t(">(() => "), i(2, "value"), t(")") }),
          sn(nil, { t("(() => "), i(1, "value"), t(")") }),
        }),
      }),
      
      s("vwatch", {
        t("watch("), i(1, "source"), t(", ("), i(2, "value"), t(", "), i(3, "oldValue"), t(") => {"),
        t({"", "  "}), i(4, "// logic"),
        t({"", "})"}),
      }),
      
      s("vwatchEffect", {
        t("watchEffect(() => {"),
        t({"", "  "}), i(1, "// reactive logic"),
        t({"", "})"}),
      }),
      
      s("vprops", {
        t("interface Props {"),
        t({"", "  "}), i(1, "prop: string"),
        t({"", "}"}),
        t({"", ""}),
        t({"", "const props = defineProps<Props>()"}),
      }),
      
      s("vemits", {
        t("interface Emits {"),
        t({"", "  "}), i(1, "event: [value: string]"),
        t({"", "}"}),
        t({"", ""}),
        t({"", "const emit = defineEmits<Emits>()"}),
      }),
    })

    luasnip.add_snippets("typescript", {
      s("tsinterface", {
        t("interface "), i(1, "Name"), t(" {"),
        t({"", "  "}), i(2, "property: string"),
        t({"", "}"}),
      }),
      
      s("tstype", {
        t("type "), i(1, "Name"), t(" = "), i(2, "string | number"),
      }),
      
      s("tsfunc", {
        t("function "), i(1, "name"), t("("), i(2, "param: string"), t("): "), i(3, "string"), t(" {"),
        t({"", "  "}), i(4, "return param"),
        t({"", "}"}),
      }),
      
      s("tsarrow", {
        t("const "), i(1, "name"), t(" = ("), i(2, "param: string"), t("): "), i(3, "string"), t(" => {"),
        t({"", "  "}), i(4, "return param"),
        t({"", "}"}),
      }),
      
      s("tsasync", {
        t("async function "), i(1, "name"), t("("), i(2, "param: string"), t("): Promise<"), i(3, "string"), t("> {"),
        t({"", "  "}), i(4, "return param"),
        t({"", "}"}),
      }),
      
      s("tsclass", {
        t("class "), i(1, "Name"), t(" {"),
        t({"", "  constructor("}), i(2, "param: string"), t(") {"),
        t({"", "    "}), i(3, "// initialization"),
        t({"", "  }"}),
        t({"", "}"}),
      }),
    })

    vim.keymap.set({"i", "s"}, "<Tab>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { desc = "Expand or jump snippet" })

    vim.keymap.set({"i", "s"}, "<S-Tab>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { desc = "Jump back in snippet" })

    vim.keymap.set("i", "<C-e>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end, { desc = "Change snippet choice" })
  end,
}