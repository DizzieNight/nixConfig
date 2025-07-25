local wk = require("which-key")
wk.add({
    -- Flutter
    {
        "<leader>f",
        group = "Flutter",
        icon = ""
    },
    {
        "<leader>ft",
        desc = "Flutter Tools",
        icon = ""
    },

    -- Lazygit
    {
        "<leader>g",
        desc = "Lazygit",
        icon = "󰊢"
    },

    -- Harpoon
    {
        "<leader>h",
        group = "Harpoon"
    },

    -- Harpoon
    {
        "<leader>t",
        group = "Telescope"
    },

    -- Window Splits
    {
        "<leader>v",
        group = "Window Splits"
    },

    -- Trouble 
    {
        "<leader>x",
        group = "Trouble"
    },
    -- Debugger
    {
        "<leader>d",
        group = "Debugger",
        nowait = true,
        remap = false,
    },
    {
        "`",
        function()
            require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
        nowait = true,
        remap = false,
    },
    {
        "<F1>",
        function()
            require("dap").continue()
        end,
        desc = "Continue",
        nowait = true,
        remap = false,
    },
    {
        "<F2>",
        function()
            require("dap").step_into()
        end,
        desc = "Step Into",
        nowait = true,
        remap = false,
    },
    {
        "<F3>",
        function()
            require("dap").step_over()
        end,
        desc = "Step Over",
        nowait = true,
        remap = false,
    },
    {
        "<F4>",
        function()
            require("dap").step_out()
        end,
        desc = "Step Out",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dr",
        function()
            require("dap").repl.open()
        end,
        desc = "Open REPL",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dl",
        function()
            require("dap").run_last()
        end,
        desc = "Run Last",
        nowait = true,
        remap = false,
    },
    {
        "<leader>dq",
        function()
            require("dap").terminate()
            require("dapui").close()
            require("nvim-dap-virtual-text").toggle()
        end,
        desc = "Terminate",
        nowait = true,
        remap = false,
    },
    {
        "<leader>db",
        function()
            require("dap").list_breakpoints()
        end,
        desc = "List Breakpoints",
        nowait = true,
        remap = false,
    },
    {
        "<leader>de",
        function()
            require("dap").set_exception_breakpoints({ "all" })
        end,
        desc = "Set Exception Breakpoints",
        nowait = true,
        remap = false,
    },
})
