return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-project.nvim",
    },
    cmd = "Telescope",
    keys = {
		{ "<leader>ff", ":Telescope find_files cwd=.<CR>", desc = "Find Files With Telescope" },
		{ "<leader>fg", ":Telescope live_grep<CR>", desc = "Find File Contents with Telescope" },
		{ "<leader>fr", ":Telescope oldfiles<cr>", desc = "Search Previously Opened Files With Telescope" },
		{ "<leader>fu", ":Telescope undo<cr>", desc = "View Undo History With Telescope" },
		{ "<leader>fb", ":Telescope buffers<cr>", desc = "Buffer Switcher" },
	},
    config = function()
        require("telescope").setup({
            extensions = {
                undo = {
                },
            },
        })
        require("telescope").load_extension("undo")
        require 'telescope'.load_extension('project')
    end,
}
