return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = "nvim-lua/plenary.nvim",
	config = function()
		local todo_comments = require("todo-comments")
		local keymap = vim.keymap

		keymap.set("n", "<leader>nt", todo_comments.jump_next, { desc = "Next todo comment" })
		keymap.set("n", "<leader>pt", todo_comments.jump_prev, { desc = "Previous todo comment" })

		todo_comments.setup()
	end,
}
