return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  config = function()
    local colors = {
      bg = "#212631",
      fg = "#ddeafb",
      p0 = "#444c5c",
      p1 = "#f3b6bb",
      p2 = "#80a988",
      p3 = "#9ac0ce",
      p4 = "#7da4ab",
      p5 = "#99b8d8",
      p6 = "#7bbad5",
      p7 = "#b4bed3",
      p8 = "#39404d",
      p12 = "#8eaada",
      p13 = "#94d1d9",
      p15 = "#e5eef6",
    }

    local flbx_theme = {
      normal = {
        a = { fg = colors.p15, bg = colors.p4, gui = 'bold' },
        b = { fg = colors.p15, bg = colors.p8 },
        c = { fg = colors.p7, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.p2, gui = 'bold' },
        b = { fg = colors.p15, bg = colors.p8 },
        c = { fg = colors.p7, bg = colors.bg },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.p13, gui = 'bold' },
        b = { fg = colors.p15, bg = colors.p8 },
        c = { fg = colors.p7, bg = colors.bg },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.p1, gui = 'bold' },
        b = { fg = colors.p15, bg = colors.p8 },
        c = { fg = colors.p7, bg = colors.bg },
      },
      command = {
        a = { fg = colors.bg, bg = colors.p6, gui = 'bold' },
        b = { fg = colors.p15, bg = colors.p8 },
        c = { fg = colors.p7, bg = colors.bg },
      },
      inactive = {
        a = { fg = colors.p7, bg = colors.p8 },
        b = { fg = colors.p7, bg = colors.p8 },
        c = { fg = colors.p0, bg = colors.bg },
      },
    }

    vim.o.laststatus = vim.g.lualine_laststatus

    local function get_lsp_client()
      local msg = ''
      local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end

    local function get_gitsigns_diff()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end

    require('lualine').setup({
      options = {
        theme = flbx_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { 'dashboard', 'alpha', 'neo-tree' } },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            diagnostics_color = {
              error = { fg = colors.p1, gui = 'bold' },
              warn = { fg = colors.p3, gui = 'bold' },
              info = { fg = colors.p12, gui = 'bold' },
              hint = { fg = colors.p2, gui = 'bold' },
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
          {
            'filename',
            path = 1,
            symbols = {
              modified = '●',
              readonly = '',
              unnamed = '[No Name]',
            },
          },
        },
        lualine_x = {
          {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            diff_color = {
              added = { fg = colors.p2 },
              modified = { fg = colors.p6 },
              removed = { fg = colors.p1 },
            },
            colored = true,
            source = get_gitsigns_diff,
          },
          {
            get_lsp_client,
            icon = ' ',
            color = { fg = colors.p4 },
          },
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            'filename',
            path = 1,
            symbols = {
              modified = '●',
              readonly = '',
              unnamed = '[No Name]',
            },
          },
        },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { 'neo-tree', 'lazy' },
    })
  end,
}
