return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-project.nvim",
    },
    cmd = "Telescope",
    config = function()
        require("telescope").setup({
            extensions = {
                undo = {
                },
            },
        })
        require("telescope").load_extension("undo")
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
        require 'telescope'.load_extension('project')
    end,
}
