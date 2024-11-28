return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim",
        'theHamsta/nvim-dap-virtual-text',
        { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }
    },
    config = function()
        require("mason").setup()
        require("mason-nvim-dap").setup()
        require("nvim-dap-virtual-text").setup()

        local dap, dapui = require("dap"), require("dapui")
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
    end
}
