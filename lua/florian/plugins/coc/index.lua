return {
	{
		"neoclide/coc.nvim",
		branch = "release",
		build = "pnpm install",
		event = "VeryLazy",
		config = function()
			-- Charger toutes les configurations
			require("florian.plugins.coc.configs.common").setup()
			require("florian.plugins.coc.configs.angular").setup()
			require("florian.plugins.coc.configs.css").setup()
			require("florian.plugins.coc.configs.html").setup()
			require("florian.plugins.coc.configs.javascript").setup()
			require("florian.plugins.coc.configs.tailwind").setup()
			require("florian.plugins.coc.configs.typescript").setup()
			require("florian.plugins.coc.configs.vue").setup()
		end
	}
}
