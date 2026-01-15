-- MagicDuck/grug-far.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    GrugFarHelpHeader = { fg = palette.green_dark },
    GrugFarHelpHeaderKey = { fg = palette.yellow_lite },
    GrugFarHelpWinActionKey = { fg = palette.yellow_lite },
    GrugFarHelpWinActionPrefix = { fg = palette.aqua_lite },
    GrugFarHelpWinActionText = { fg = palette.green_dark },
    GrugFarHelpWinHeader = { link = "FloatTitle" },
    GrugFarInputLabel = { fg = palette.aqua_lite },
    GrugFarInputPlaceholder = { link = "Comment" },
    GrugFarResultsActionMessage = { fg = palette.aqua_lite },
    GrugFarResultsChangeIndicator = { fg = groups.git_change },
    GrugFarResultsRemoveIndicator = { fg = groups.git_delete },
    GrugFarResultsAddIndicator = { fg = groups.git_add },
    GrugFarResultsHeader = { fg = palette.green_dark },
    GrugFarResultsLineNo = { fg = palette.purple_lite },
    GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
    GrugFarResultsMatch = { link = "CurSearch" },
    GrugFarResultsPath = { fg = palette.aqua_lite },
    GrugFarResultsStats = { fg = palette.purple_lite },
  }
end

return M
