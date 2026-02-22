return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "ramboe/ramboe-dotnet-utils",
        },
        event = "VeryLazy",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            local mason_path = vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg"
            local netcoredbg_adapter = {
                type = "executable",
                command = mason_path,
                args = { "--interpreter=vscode" },
            }

            dapui.setup({
                expand_lines = true,
                controls = { enabled = false },
                floating = { border = "rounded" },
                render = {
                    max_type_length = 60,
                    max_value_lines = 200,
                },
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 1.0 },
                        },
                        size = 15,
                        position = "bottom",
                    },
                },
            })

            dap.adapters.netcoredbg = netcoredbg_adapter
            dap.adapters.coreclr = netcoredbg_adapter

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    program = function()
                        return require("dap-dll-autopicker").build_dll_path()
                    end
                }
            }

            local map = vim.keymap.set
            local opts = { noremap = true, silent = true }

            map("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
            map("n", "<F6>", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
            map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
            map("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
            map("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
            map("n", "<F8>", "<cmd>lua require'dap'.step_out()<CR>", opts)
            map("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts, { desc = "DAP repl open" })
            map("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts, { desc = "DAP run last" })
            map("n", "<leader>dt", "<cmd>lua require('neotest').run.run({strategy='dap'})<CR>", {
                noremap = true, silent = true, desc = "debug nearest test" })

            map("n", "<leader>du", function() dapui.toggle() end,
                { noremap = true, silent = true, desc = "Toggle DAP UI" })
            map({ "n", "v" }, "<leader>dw", function() dapui.eval(nil, { enter = true }) end,
                { noremap = true, silent = true, desc = "Add word under cursor to Watches" })
            map({ "n", "v" }, "Q", function() dapui.eval() end,
                {
                    noremap = true,
                    silent = true,
                    desc =
                    "Hover/eval a single value (opens a tiny window instead of expanding the full object)"
                })

            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

            vim.fn.sign_define('DapBreakpoint',
                {
                    text = '⚪',
                    texthl = 'DapBreakpointSymbol',
                    linehl = 'DapBreakpoint',
                    numhl = 'DapBreakpoint'
                })

            vim.fn.sign_define('DapStopped',
                {
                    text = '🔴',
                    texthl = 'yellow',
                    linehl = 'DapBreakpoint',
                    numhl = 'DapBreakpoint'
                })
            vim.fn.sign_define('DapBreakpointRejected',
                {
                    text = '⭕',
                    texthl = 'DapStoppedSymbol',
                    linehl = 'DapBreakpoint',
                    numhl = 'DapBreakpoint'
                })
        end,
    },
}
