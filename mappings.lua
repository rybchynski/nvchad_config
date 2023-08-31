---@type MappingsConfig
local M = {}

M.disabled = {
	n = {
		["<tab>"] = "",
	},
}

M.general = {
	n = {
		["<leader>w"] = { "<cmd> w <CR>", "Save file" },
	},
	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
}

M.toggleterm = {
	n = {
		["<A-i>"] = { "<cmd> ToggleTerm direction=float<CR>", "Toggle Float Terminal" },
		["<A-h>"] = { "<cmd> ToggleTerm size=20 direction=horizontal<CR>", "Toggle Horizontal Terminal" },
		["<A-v>"] = { "<cmd> ToggleTerm size=80 direction=vertical<CR>", "Toggle Vertical Terminal" },
	},

	t = {
		["<A-i>"] = { "<cmd> ToggleTerm direction=float<CR>", "Toggle Float Terminal" },
		["<A-h>"] = { "<cmd> ToggleTerm size=20 direction=horizontal<CR>", "Toggle Horizontal Terminal" },
		["<A-v>"] = { "<cmd> ToggleTerm size=80 direction=vertical<CR>", "Toggle Vertical Terminal" },
	},
}

M.nvimtree = {
	n = {
		-- toggle
		["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

		-- focus
		["<C-n>"] = { "<cmd> NvimTreeFocus <CR>", "Focus nvimtree" },

		-- find current buffer in the tree.
		["<leader>fc"] = { "<cmd> NvimTreeFindFile <CR>", "Find current file in the tree" },
	},
}

M.tabufline = {
	n = {
		L = {
			function()
				require("nvchad.tabufline").tabuflineNext()
			end,
			"Goto next buffer",
		},
		H = {
			function()
				require("nvchad.tabufline").tabuflinePrev()
			end,
			"Goto prev buffer",
		},
	},
}

M.lspconfig = {
	n = {
		["<leader>lg"] = {
			function()
				vim.diagnostic.open_float { border = "rounded" }
			end,
			"Floating diagnostic",
		},
	},
}

return M
