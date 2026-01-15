-- OXY2DEV/markview.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    MarkviewPalette1 = { fg = palette.red_dark, bg = "#3B1F1F" },
    MarkviewPalette2 = { fg = palette.yellow_dark, bg = "#332B1F" },
    MarkviewPalette3 = { fg = palette.green_dark, bg = "#2F2F1F" },
    MarkviewPalette4 = { fg = palette.purple_dark, bg = "#2F1F28" },
    MarkviewPalette5 = { fg = palette.blue_dark, bg = "#1F2A2F" },
    MarkviewPalette6 = { fg = palette.aqua_dark, bg = "#1F2F23" },

  }
end

return M
