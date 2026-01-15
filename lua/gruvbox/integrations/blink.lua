-- Saghen/blink.cmp
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    BlinkCmpDoc = { bg = palette.bg_main },
    BlinkCmpDocSeparator = { fg = palette.gray, bg = palette.none },
    BlinkCmpDocBorder = utilities.make_border(palette.blue_lite, config, palette, styles),
    BlinkCmpGhostText = { fg = palette.bg4 },
    BlinkCmpLabel = { fg = palette.fg4 },
    BlinkCmpLabelDeprecated = { fg = palette.fg4, strikethrough = true },
    BlinkCmpLabelMatch = { fg = palette.fg, bold = styles.bold },
    BlinkCmpDefault = { fg = palette.fg1 },
    BlinkCmpKindText = { fg = palette.green_dark },
    BlinkCmpKindMethod = { fg = palette.aqua_lite },
    BlinkCmpKindFunction = { fg = palette.aqua_lite },
    BlinkCmpKindConstructor = { fg = palette.aqua_lite },
    BlinkCmpKindField = { fg = palette.green_dark },
    BlinkCmpKindVariable = { fg = palette.purple_lite },
    BlinkCmpKindClass = { fg = palette.yellow_lite },
    BlinkCmpKindInterface = { fg = palette.yellow_lite },
    BlinkCmpKindModule = { fg = palette.aqua_lite },
    BlinkCmpKindProperty = { fg = palette.aqua_lite },
    BlinkCmpKindUnit = { fg = palette.green_dark },
    BlinkCmpKindValue = { fg = palette.red_lite },
    BlinkCmpKindKeyword = { fg = palette.purple_lite },
    BlinkCmpKindSnippet = { fg = palette.purple_lite },
    BlinkCmpKindColor = { fg = palette.red_lite },
    BlinkCmpKindFile = { fg = palette.aqua_lite },
    BlinkCmpKindReference = { fg = palette.red_lite },
    BlinkCmpKindFolder = { fg = palette.aqua_lite },
    BlinkCmpKindEnum = { fg = palette.aqua_lite },
    BlinkCmpKindEnumMember = { fg = palette.aqua_lite },
    BlinkCmpKindConstant = { fg = palette.yellow_lite },
    BlinkCmpKindStruct = { fg = palette.aqua_lite },
    BlinkCmpKindEvent = { fg = palette.aqua_lite },
    BlinkCmpKindOperator = { fg = palette.aqua_lite },
    BlinkCmpKindTypeParameter = { fg = palette.purple_lite },
    BlinkCmpKindCodeium = { fg = palette.aqua_lite },
    BlinkCmpKindCopilot = { fg = palette.aqua_lite },
    BlinkCmpKindSupermaven = { fg = palette.aqua_lite },
    BlinkCmpKindTabNine = { fg = palette.aqua_lite },
  }
end

return M
