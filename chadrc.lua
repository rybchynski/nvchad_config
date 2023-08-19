local M = {}

-- path to overriding theme and highlights files.
local highlights = require "custom.highlights"

M.ui = {
	theme = "catppuccin",
	hl_override = highlights.override,
	hl_add = highlights.add,

	statusline = { theme = "default" }, -- default/vscode/vscode_colored/minimal

	-- nvdash (dashboard)
	nvdash = { load_on_startup = true },
	transparency = false,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure.
M.mappings = require "custom.mappings"

return M
