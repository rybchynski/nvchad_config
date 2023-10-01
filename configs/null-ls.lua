local null_ls = require "null-ls"
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	-- webdev js/ts.
	formatting.deno_fmt,
	-- formatting.eslint_d.with {
	-- 	filetypes = {
	-- 		"typescript",
	-- 		"javascript",
	-- 		"typescriptreact",
	-- 		"javascriptreact",
	-- 	},
	-- },
	--
	-- lint.eslint_d,

	-- golang.
	formatting.gofmt,
	formatting.goimports,

	formatting.phpcbf.with { filetypes = { "php" }, extra_args = { "--standard=Drupal" } },

	-- lua.
	formatting.stylua,
	formatting.prettierd.with {
		filetypes = {
			"css",
			"scss",
			"less",
			"html",
			"json",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
			"prisma",
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},
	},
}

-- null_ls auto save.
null_ls.setup {
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method "textDocument/formatting" then
			vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format {
						bufnr = bufnr,
						filter = function(client)
							return client.name == "null-ls"
						end,
					}
					-- vim.lsp.buf.formatting_sync()
				end,
			})
		end
	end,
}
