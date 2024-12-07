vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 1500 })
	end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost" }, {
	command = "write",
})

vim.api.nvim_create_autocmd({ "FocusGained", "CursorHold" }, {
	pattern = "*",
	command = "checktime",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown,text,latex",
	callback = function()
		vim.wo.spell = true
	end,
})
