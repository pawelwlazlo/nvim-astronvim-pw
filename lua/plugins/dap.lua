-- ~/…/nvim/lua/user/plugins/dap.lua
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "williamboman/mason.nvim", -- do instalacji adapterów
      "jay-babu/mason-nvim-dap.nvim", -- integracja Mason + nvim-dap
    },
    -- Załaduj dopiero po Mason i mason-nvim-dap
    event = "VeryLazy",
    config = function()
      local dap = require "dap"
      local mason_dap = require "mason-nvim-dap"

      -- Zainicjuj mason-nvim-dap (instaluje adaptery)
      mason_dap.setup {
        ensure_installed = { "node2", "delve" },
        automatic_installation = true,
        handlers = {},
      }

      -- Definicja adaptera dla Node.js
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          vim.fn.stdpath "data" .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js",
        },
      }
      dap.configurations.javascript = {
        {
          name = "Launch Node",
          type = "node2",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = "inspector",
        },
      }
      dap.configurations.typescript = dap.configurations.javascript

      -- Definicja adaptera dla Go (Delve)
      dap.adapters.go = {
        type = "server",
        host = "127.0.0.1",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }
      dap.configurations.go = {
        {
          name = "Debug Go File",
          type = "go",
          request = "launch",
          program = "${file}",
          cwd = vim.fn.getcwd(),
        },
      }

      -- (Opcjonalnie) integracja z nvim-dap-ui, jeśli masz zainstalowane
      -- local dapui = require("dapui")
      -- dapui.setup()
      -- dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      -- dap.listeners.before.event_terminated["dapui_config"]    = function() dapui.close() end
      -- dap.listeners.before.event_exited["dapui_config"]        = function() dapui.close() end
    end,
  },
}
