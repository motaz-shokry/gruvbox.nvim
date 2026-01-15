-- nvim-neotest/neotest
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    NeotestAdapterName = { fg = palette.purple_lite },
    NeotestBorder = utilities.make_border(palette.highlight_med, config, palette, styles),
    NeotestDir = { fg = palette.aqua_lite },
    NeotestExpandMarker = { fg = palette.highlight_med },
    NeotestFailed = { fg = palette.red_lite },
    NeotestFile = { fg = palette.fg },
    NeotestFocused = { fg = palette.yellow_lite, bg = palette.highlight_med },
    NeotestIndent = { fg = palette.highlight_med },
    NeotestMarked = { fg = palette.purple_lite, bold = styles.bold },
    NeotestNamespace = { fg = palette.yellow_lite },
    NeotestPassed = { fg = palette.green_dark },
    NeotestRunning = { fg = palette.yellow_lite },
    NeotestWinSelect = { fg = palette.fg4 },
    NeotestSkipped = { fg = palette.gray },
    NeotestTarget = { fg = palette.red_lite },
    NeotestTest = { fg = palette.yellow_lite },
    NeotestUnknown = { fg = palette.gray },
    NeotestWatching = { fg = palette.purple_lite },
  }
end

return M
