return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			-- Map <leader>e to open Neo-tree at the project root directory
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root() })
				end,
				desc = "Explorer NeoTree (Root Dir)",
			},
			-- Map <leader>E to open Neo-tree at the current working directory
			{
				"<leader>E",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
		},
	},
	{
		"Crysthamus/nvim-file-operations",
		-- branch = "compat" -- if you are on Neovim <= 0.10
		dependencies = {
			"nvim-neo-tree/neo-tree.nvim", -- makes sure that this loads after Neo-tree.
		},
		config = function()
			require("nvim-file-operations").setup()
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					-- filter using buffer options
					bo = {
						-- if the file type is one of following, the window will be ignored
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						-- if the buffer type is one of following, the window will be ignored
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
	{
		"folke/snacks.nvim",
		opts = {
			explorer = { enabled = false },
		},
		-- Explicitly disable conflicting snacks keymaps if necessary
		keys = {
			{ "<leader>e", false },
			{ "<leader>E", false },
		},
	},
}
