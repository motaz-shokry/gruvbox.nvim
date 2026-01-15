-- telescope.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    TelescopeBorder = utilities.make_border(groups.border, config, palette, styles),
    TelescopeMatching = { fg = palette.purple_lite },
    TelescopeNormal = { link = "NormalFloat" },
    TelescopePromptNormal = { link = "TelescopeNormal" },
    TelescopePromptPrefix = { fg = palette.gray },
    TelescopeSelection = { fg = palette.fg, bg = palette.bg3 },
    TelescopeSelectionCaret = { fg = palette.purple_lite, bg = palette.bg3 },
    TelescopeTitle = { fg = palette.aqua_lite, bold = styles.bold },
  }
end

return M
