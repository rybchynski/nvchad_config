local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"scss",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"markdown",
		"php",
		"go",
		"vue",
		"xml",
		"yaml",
	},
}

M.mason = {
	ensure_installed = {
		-- lua.
		"lua-language-server",
		"stylua",

		-- web.
		"css-lsp",
		"html-lsp",
		"deno",
		"emmet-ls",
		"json-lsp",
		"phpactor",
		"php-cs-fixer",
		"prettier",
		"tailwindcss-language-server",
		"typescript-language-server",
		"vue-language-server",
		"yaml-language-server",
		"yamlfmt",
		"twigcs",

		-- go related.
		"gofumpt",
		"gopls",
		"goimports",
	},
}

M.nvimtree = {
	git = {
		enable = true,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.telescope = {
	--configure folke/flash for telescop integration.
	opts = function(_, opts)
		local function flash(prompt_bufnr)
			require("flash").jump {
				pattern = "^",
				label = { after = { 0, 0 } },
				search = {
					mode = "search",
					exclude = {
						function(win)
							return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "TelescopeResults"
						end,
					},
				},
				action = function(match)
					local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
					picker:set_selection(match.pos[1] - 1)
				end,
			}
		end
		opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
			mappings = {
				n = { s = flash },
				i = { ["<c-s>"] = flash },
			},
		})
	end,
}

return M
