{
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "echasnovski/mini.icons" },
  config = function()
    require("which-key").setup()

    require("which-key").register({
      -- ⤷ MENU : Diagnostics
      d = {
        name = " Diagnostics",
        dd = { function() vim.diagnostic.open_float() end, "Show All Diagnostics" },
        dp = { function() vim.diagnostic.goto_prev() end, "Prev Diagnostic" },
        dn = { function() vim.diagnostic.goto_next() end, "Next Diagnostic" },
      },

      -- ⤷ MENU : LSP/Buffer
      r = {
        name = "󰒓 LSP/Buffer",
        n = { function() vim.lsp.buf.rename() end, "Rename Symbol" },
        r = { "<cmd>e!<CR>", "Reload Buffer" },
      },

      -- ⤷ MENU : Buffer/Code
      c = {
        name = "󰆏 Buffer/Code",
        w = { "<cmd>NvimTreeOpen<CR>", "Open File Manager" },
        a = { function() vim.lsp.buf.code_action() end, "Code Actions" },
      },

      -- ⤷ MENU : Files
      f = {
        name = " Files",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep Text" },
        b = { "<cmd>Telescope buffers<cr>", "Buffers" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent Files" },
        t = { "<cmd>TodoTelescope<cr>", "Find TODOs" },
      },

      -- ⤷ MENU : Git
      g = {
        name = " Git",
        l = { "<cmd>LazyGit<cr>", "Open LazyGit" },
        p = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
        m = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Blame" },
      },

      -- ⤷ MENU : Explorer
      e = {
        name = " Explorer",
        e = { "<cmd>NvimTreeToggle<CR>", "Toggle File Explorer" },
        f = { "<cmd>NvimTreeFindFileToggle<CR>", "Reveal in Explorer" },
        c = { "<cmd>NvimTreeCollapse<CR>", "Collapse Explorer" },
        r = { "<cmd>NvimTreeRefresh<CR>", "Refresh Explorer" },
      },

      -- ⤷ MENU : Angular
      a = {
        name = " Angular",
        c = { function() require("ng-croissant").goto_component_ts() end, "Component.ts" },
        t = { function() require("ng-croissant").goto_component_html() end, "Component.html" },
        s = { function() require("ng-croissant").goto_component_spec() end, "Component.spec.ts" },
      },

      -- ⤷ MENU : LSP
      l = {
        name = " LSP",
        d = { function() vim.lsp.buf.definition() end, "Go to Definition" },
        i = { function() vim.lsp.buf.implementation() end, "Go to Implementation" },
        r = { function() vim.lsp.buf.references() end, "References" },
        h = { function() vim.lsp.buf.hover() end, "Hover Info" },
        a = { function() vim.lsp.buf.code_action() end, "Code Action" },
        n = { function() vim.lsp.buf.rename() end, "Rename Symbol" },
        f = { function() vim.lsp.buf.format({async=true}) end, "Format File" },
      },

      -- ⤷ MENU : Trouble/TODOS
      t = {
        name = " Trouble/TODOs",
        d = { "<cmd>Trouble diagnostics toggle<cr>", "Trouble Diagnostics" },
        w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics" },
        x = { "<cmd>TodoTrouble<CR>", "TODOs in Trouble" },
        f = { function() require("todo-comments").jump_next() end, "Next TODO" },
        p = { function() require("todo-comments").jump_prev() end, "Prev TODO" },
      },

      -- ⤷ COMMANDES UTILITAIRES (pas de overlap car pas de sous-menu)
      w = { "<cmd>w<CR>", " Save File" },
      q = { "<cmd>q<CR>", " Quit Window" },
      nh = { "<cmd>nohlsearch<CR>", " Clear Highlight" },
    }, { prefix = "<leader>", mode = "n" })
  end,
}
