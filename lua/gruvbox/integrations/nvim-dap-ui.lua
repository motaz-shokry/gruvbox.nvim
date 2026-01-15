-- rcarriga/nvim-dap-ui
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    DapUIBreakpointsCurrentLine = { fg = palette.yellow_lite, bold = styles.bold },
    DapUIBreakpointsDisabledLine = { fg = palette.fg4 },
    DapUIBreakpointsInfo = { link = "DapUIThread" },
    DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
    DapUIBreakpointsPath = { fg = palette.aqua_lite },
    DapUIDecoration = { link = "DapUIBreakpointsPath" },
    DapUIFloatBorder = utilities.make_border(groups.border, config, palette, styles),
    DapUIFrameName = { fg = palette.fg },
    DapUILineNumber = { link = "DapUIBreakpointsPath" },
    DapUIModifiedValue = { fg = palette.aqua_lite, bold = styles.bold },
    DapUIScope = { link = "DapUIBreakpointsPath" },
    DapUISource = { fg = palette.purple_lite },
    DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
    DapUIThread = { fg = palette.yellow_lite },
    DapUIValue = { fg = palette.fg },
    DapUIVariable = { fg = palette.fg },
    DapUIType = { fg = palette.purple_lite },
    DapUIWatchesEmpty = { fg = palette.red_lite },
    DapUIWatchesError = { link = "DapUIWatchesEmpty" },
    DapUIWatchesValue = { link = "DapUIThread" },
  }
end

return M
