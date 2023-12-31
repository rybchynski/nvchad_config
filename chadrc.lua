local M = {}

-- path to overriding theme and highlights files.
local highlights = require "custom.highlights"

M.ui = {
	------------------------------- base46 -------------------------------------
	theme = "nightowl",
	hl_override = highlights.override,
	hl_add = highlights.add,

	------------------------------- nvchad_ui modules -----------------------------
	-- nvdash (dashboard)
	nvdash = { load_on_startup = true },
	transparency = false,

	-- statusline
	statusline = {
		theme = "default",
		separator_style = "round",
	}, -- default/vscode/vscode_colored/minimal
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure.
M.mappings = require "custom.mappings"

return M
