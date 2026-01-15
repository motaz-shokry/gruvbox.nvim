-- HiPhish/rainbow-delimiters.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    RainbowDelimiterBlue = { fg = palette.green_dark },
    RainbowDelimiterCyan = { fg = palette.aqua_lite },
    RainbowDelimiterGreen = { fg = palette.green_lite },
    RainbowDelimiterOrange = { fg = palette.purple_lite },
    RainbowDelimiterRed = { fg = palette.red_lite },
    RainbowDelimiterViolet = { fg = palette.purple_lite },
    RainbowDelimiterYellow = { fg = palette.yellow_lite },
  }
end

return M

