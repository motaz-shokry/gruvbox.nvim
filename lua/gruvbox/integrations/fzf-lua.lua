-- fzf-lua
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    FzfLuaBorder = utilities.make_border(groups.border, config, palette, styles),
    FzfLuaBufFlagAlt = { fg = palette.gray },
    FzfLuaBufFlagCur = { fg = palette.gray },
    FzfLuaCursorLine = { fg = palette.fg, bg = palette.bg3 },
    FzfLuaFilePart = { fg = palette.fg },
    FzfLuaHeaderBind = { fg = palette.purple_lite },
    FzfLuaHeaderText = { fg = palette.red_lite },
    FzfLuaNormal = { link = "NormalFloat" },
    FzfLuaTitle = { link = "FloatTitle" },
  }
end

return M
