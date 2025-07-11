local p = require("gruvbox.palette")
local config = require("gruvbox.config")

local bg_base = p.bg_second
if config.options.styles.transparency then
	bg_base = "NONE"
end

return {
	normal = {
		a = { bg = p.bg_third, fg = p.blue_lite, gui = "bold" },
		b = { bg = bg_base, fg = p.fg2 },
		c = { bg = bg_base, fg = p.fg2 },
		x = { bg = bg_base, fg = p.aqua_dark },
		y = { bg = bg_base, fg = p.yellow_dark },
		z = { bg = bg_base, fg = p.blue_dark },
	},
	insert = {
		a = { bg = p.bg_third, fg = p.green_lite, gui = "bold" },
		b = { bg = bg_base, fg = p.fg2 },
		c = { bg = bg_base, fg = p.fg2 },
		x = { bg = bg_base, fg = p.aqua_dark },
		y = { bg = bg_base, fg = p.yellow_dark },
		z = { bg = bg_base, fg = p.blue_dark },
	},
	visual = {
		a = { bg = p.bg_third, fg = p.yellow_lite, gui = "bold" },
		b = { bg = bg_base, fg = p.fg2 },
		c = { bg = bg_base, fg = p.fg2 },
		x = { bg = bg_base, fg = p.aqua_dark },
		y = { bg = bg_base, fg = p.yellow_dark },
		z = { bg = bg_base, fg = p.blue_dark },
	},
	replace = {
		a = { bg = p.bg_third, fg = p.orange_lite, gui = "bold" },
		b = { bg = bg_base, fg = p.fg2 },
		c = { bg = bg_base, fg = p.fg2 },
		x = { bg = bg_base, fg = p.aqua_dark },
		y = { bg = bg_base, fg = p.yellow_dark },
		z = { bg = bg_base, fg = p.blue_dark },
	},
	command = {
		a = { bg = p.bg_third, fg = p.purple_lite, gui = "bold" },
		b = { bg = bg_base, fg = p.fg2 },
		c = { bg = bg_base, fg = p.fg2 },
		x = { bg = bg_base, fg = p.aqua_dark },
		y = { bg = bg_base, fg = p.yellow_dark },
		z = { bg = bg_base, fg = p.blue_dark },
	},
	inactive = {
		a = { bg = p.bg_third, fg = p.gray, gui = "bold" },
		b = { bg = bg_base, fg = p.gray },
		c = { bg = bg_base, fg = p.gray },
		x = { bg = bg_base, fg = p.aqua_dark },
		y = { bg = bg_base, fg = p.yellow_dark },
		z = { bg = bg_base, fg = p.blue_dark },
	},
}
