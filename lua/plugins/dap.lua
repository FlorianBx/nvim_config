return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    
    keys = {
      { "zb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "zc", function() require("dap").continue() end, desc = "Continue" },
      { "zs", function() require("dap").step_into() end, desc = "Step Into" },
      { "zS", function() require("dap").step_over() end, desc = "Step Over" },
      { "zu", function() require("dap").step_out() end, desc = "Step Out" },
      { "zd", function() require("dapui").toggle() end, desc = "Debug UI" },
      { "zx", function() require("dap").terminate() end, desc = "Terminate" },
      
      { "zr", function() require("dap").repl.open() end, desc = "Open REPL" },
      { "zl", function() require("dap").run_last() end, desc = "Run Last" },
      { "zt", function() 
        require("dap").run({
          type = "pwa-node",
          request = "launch",
          name = "Debug Vitest Tests",
          runtimeExecutable = "npm",
          runtimeArgs = { "run", "test" },
          console = "integratedTerminal",
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        })
      end, desc = "Debug Tests" },
      { "zB", function() 
        require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) 
      end, desc = "Conditional Breakpoint" },
    },
    
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      
      require("mason-nvim-dap").setup({
        ensure_installed = { "js-debug-adapter" },
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      })
      
      dap.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "js-debug-adapter",
          args = { "${port}" },
        },
      }
      
      dap.adapters["pwa-chrome"] = {
        type = "server",
        host = "localhost", 
        port = "${port}",
        executable = {
          command = "js-debug-adapter",
          args = { "${port}" },
        },
      }
      
      local js_languages = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" }
      
      for _, language in ipairs(js_languages) do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch Current File (Node)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            console = "integratedTerminal",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node Process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
          
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Vue App (Vite)",
            url = "http://localhost:5173",
            webRoot = "${workspaceFolder}/src",
            sourceMaps = true,
            skipFiles = { "**/node_modules/**" },
          },
          
          {
            type = "pwa-chrome",
            request = "launch", 
            name = "Launch Vue App (Webpack)",
            url = "http://localhost:8080",
            webRoot = "${workspaceFolder}/src",
            sourceMaps = true,
            skipFiles = { "**/node_modules/**" },
          },
          
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Vitest Tests",
            runtimeExecutable = "npm",
            runtimeArgs = { "run", "test" },
            console = "integratedTerminal",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
        }
      end
      
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
        mappings = {
          expand = { "<CR>", "<2-LeftMouse>" },
          open = "o",
          remove = "d",
          edit = "e",
          repl = "r",
          toggle = "t",
        },
        layouts = {
          {
            elements = {
              { id = "scopes", size = 0.33 },
              { id = "breakpoints", size = 0.17 },
              { id = "stacks", size = 0.25 },
              { id = "watches", size = 0.25 },
            },
            position = "right",
            size = 0.33,
          },
          {
            elements = {
              { id = "repl", size = 0.45 },
              { id = "console", size = 0.55 },
            },
            position = "bottom",
            size = 0.27,
          },
        },
        floating = {
          max_height = 0.9,
          max_width = 0.5,
          border = "rounded",
          mappings = { close = { "q", "<Esc>" } },
        },
      })
      
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        enabled_commands = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = false,
        show_stop_reason = true,
        commented = true,
        only_first_definition = true,
        all_references = false,
        display_callback = function(variable, buf, stackframe, node, options)
          if options.virt_text_pos == 'inline' then
            return ' = ' .. variable.value
          else
            return variable.name .. ' = ' .. variable.value
          end
        end,
        virt_text_pos = vim.fn.has('nvim-0.10') == 1 and 'inline' or 'eol',
      })
      
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      
      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◉", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
      vim.fn.sign_define("DapStopped", { text = "▶", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
      vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
      
      vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#e06c75" })
      vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#e5c07b" })
      vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379", bg = "#2c323c" })
      vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#5c6370" })
    end,
  },
}
