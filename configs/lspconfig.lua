local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
	"html",
	"cssls",
	"graphql",
	"gopls",
	"jsonls",
	"lua_ls",
	"yamlls",
	"vuels",
	"dockerls",
	"emmet_ls",
	"tailwindcss",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup { on_attach = on_attach, capabilities = capabilities }
end

lspconfig.phpactor.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "php", "module", "theme", "inc" },
	root_dir = lspconfig.util.root_pattern("composer.json", ".git"),
}

lspconfig.emmet_ls.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"typescriptreact",
		"javascriptreact",
		"css",
		"sass",
		"scss",
		"less",
		"javascript",
		"typescript",
		"markdown",
	},
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L26
				["bem.enabled"] = true,
			},
		},
	},
}

lspconfig.tsserver.setup {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	init_options = { hostInfo = "neovim" },
	root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}
