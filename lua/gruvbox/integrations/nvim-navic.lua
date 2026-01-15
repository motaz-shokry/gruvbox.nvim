-- SmiteshP/nvim-navic
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    NavicIconsArray = { fg = palette.yellow_lite },
    NavicIconsBoolean = { fg = palette.purple_lite },
    NavicIconsClass = { fg = palette.aqua_lite },
    NavicIconsConstant = { fg = palette.yellow_lite },
    NavicIconsConstructor = { fg = palette.yellow_lite },
    NavicIconsEnum = { fg = palette.yellow_lite },
    NavicIconsEnumMember = { fg = palette.aqua_lite },
    NavicIconsEvent = { fg = palette.yellow_lite },
    NavicIconsField = { fg = palette.aqua_lite },
    NavicIconsFile = { fg = palette.fg4 },
    NavicIconsFunction = { fg = palette.green_dark },
    NavicIconsInterface = { fg = palette.aqua_lite },
    NavicIconsKey = { fg = palette.purple_lite },
    NavicIconsKeyword = { fg = palette.green_dark },
    NavicIconsMethod = { fg = palette.purple_lite },
    NavicIconsModule = { fg = palette.purple_lite },
    NavicIconsNamespace = { fg = palette.fg4 },
    NavicIconsNull = { fg = palette.red_lite },
    NavicIconsNumber = { fg = palette.yellow_lite },
    NavicIconsObject = { fg = palette.yellow_lite },
    NavicIconsOperator = { fg = palette.gray },
    NavicIconsPackage = { fg = palette.fg4 },
    NavicIconsProperty = { fg = palette.aqua_lite },
    NavicIconsString = { fg = palette.yellow_lite },
    NavicIconsStruct = { fg = palette.aqua_lite },
    NavicIconsTypeParameter = { fg = palette.aqua_lite },
    NavicIconsVariable = { fg = palette.fg },
    NavicSeparator = { fg = palette.gray },
    NavicText = { fg = palette.gray },
  }
end

return M
