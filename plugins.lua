local overrides = require "custom.configs.overrides"

local plugins = {
	-- nvim-lspconfig.
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require "custom.configs.null-ls"
			end,
		},

		config = function()
			require "plugins.configs.lspconfig"
			require "custom.configs.lspconfig"
		end,
	},

	-- mason config.
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	-- treesitter config.
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	-- nvim-tree config.
	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 200
		end,
	},

	-- telescope config.
	{
		"nvim-telescope/telescope.nvim",
		optional = true,
		opts = overrides.telescope,
	},

	{
		"NvChad/nvterm",
		enabled = false,
	},

	{
		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm", "TermExec" },
		opts = {
			highlights = {
				Normal = { link = "Normal" },
				NormalNC = { link = "NormalNC" },
				NormalFloat = { link = "NormalFloat" },
				FloatBorder = { link = "FloatBorder" },
				StatusLine = { link = "StatusLine" },
				StatusLineNC = { link = "StatusLineNC" },
				WinBar = { link = "WinBar" },
				WinBarNC = { link = "WinBarNC" },
			},
			size = 10,
			on_create = function()
				vim.opt.foldcolumn = "0"
				vim.opt.signcolumn = "no"
			end,
			open_mapping = [[F7]],
			shading_factor = 2,
			direction = "float",
			float_opts = { border = "rounded" },
		},
	},

	-- react snippets.
	{
		"dsznajder/vscode-es7-javascript-react-snippets",
		run = "yarn install --frozen-lockfile && yarn compile",
	},

	-- easy motion plugin.
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			label = {
				rainbow = {
					enabled = true,
					shade = 3,
				},
			},
		},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
	},
}

return plugins
