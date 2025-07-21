return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local mason_dap = require("mason-nvim-dap")
    local dap_virtual_text = require("nvim-dap-virtual-text")

    -- Virtual Text Setup
    dap_virtual_text.setup({
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
      display_callback = function(variable, buf, stackframe, node, options)
        if options.virt_text_pos == "inline" then
          return " = " .. variable.value
        else
          return variable.name .. " = " .. variable.value
        end
      end,
    })

    -- Mason DAP Setup
    mason_dap.setup({
      ensure_installed = { "js-debug-adapter", "nlua" },
      automatic_installation = true,
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    -- DAP UI Setup
    dapui.setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = "",
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      render = {
        indent = 1,
        max_value_lines = 100,
      },
    })

    -- Debugger Configurations
    dap.configurations.javascript = {
      {
        name = "Launch Node.js",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        name = "Attach to Node.js",
        type = "pwa-node",
        request = "attach",
        processId = require("dap.utils").pick_process,
        cwd = vim.fn.getcwd(),
      },
    }

    dap.configurations.typescript = {
      {
        name = "Launch TypeScript with Node.js",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        runtimeArgs = { "--experimental-strip-types" },
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        name = "Attach to Node.js",
        type = "pwa-node",
        request = "attach",
        processId = require("dap.utils").pick_process,
        cwd = vim.fn.getcwd(),
      },
    }

    dap.configurations.vue = {
      {
        name = "Launch Chrome for Vue.js",
        type = "pwa-chrome",
        request = "launch",
        url = function()
          local value = vim.fn.input("Enter URL: ", "http://localhost:5173")
          return value
        end,
        webRoot = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
      },
      {
        name = "Attach to Chrome",
        type = "pwa-chrome",
        request = "attach",
        port = 9222,
        webRoot = vim.fn.getcwd(),
      },
      {
        name = "Launch Vue.js with Node.js (SSR)",
        type = "pwa-node",
        request = "launch",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
    }

    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
        host = function()
          local value = vim.fn.input("Host [127.0.0.1]: ")
          if value ~= "" then
            return value
          end
          return "127.0.0.1"
        end,
        port = function()
          local val = tonumber(vim.fn.input("Port: ", "8086"))
          assert(val, "Please provide a port number")
          return val
        end,
      },
    }

    -- Set up adapter for nlua
    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    -- Set up pwa-node adapter manually
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    -- Set up pwa-chrome adapter manually
    dap.adapters["pwa-chrome"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    -- Event Listeners
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

    -- Keybindings
    vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<Leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Conditional Breakpoint" })
    vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<Leader>dC", dap.run_to_cursor, { desc = "Run to Cursor" })
    vim.keymap.set("n", "<Leader>dg", dap.goto_, { desc = "Go to line (no execute)" })
    vim.keymap.set("n", "<Leader>di", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<Leader>dj", dap.down, { desc = "Down" })
    vim.keymap.set("n", "<Leader>dk", dap.up, { desc = "Up" })
    vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last" })
    vim.keymap.set("n", "<Leader>do", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<Leader>dO", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<Leader>dp", dap.pause, { desc = "Pause" })
    vim.keymap.set("n", "<Leader>dr", dap.repl.toggle, { desc = "Toggle REPL" })
    vim.keymap.set("n", "<Leader>ds", dap.session, { desc = "Session" })
    vim.keymap.set("n", "<Leader>dt", dap.terminate, { desc = "Terminate" })
    vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "Toggle UI" })

    -- Function key bindings (standard debugging keys)
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step Over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step Into" })
    vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step Out" })
    vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
  end,
}
