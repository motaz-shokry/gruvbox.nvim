-- lukas-reineke/indent-blankline.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    IndentBlanklineChar = { fg = palette.bg2, nocombine = true },
    IndentBlanklineSpaceChar = { fg = palette.bg2, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = palette.bg2, nocombine = true },
    IblIndent = { fg = palette.bg3 },
    IblScope = { fg = palette.aqua_lite },
    IblWhitespace = { fg = palette.bg3 },
  }
end

return M
