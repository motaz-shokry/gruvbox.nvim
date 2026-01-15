-- goolord/alpha-nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    AlphaButtons = { fg = palette.aqua_lite },
    AlphaFooter = { fg = palette.yellow_lite },
    AlphaHeader = { fg = palette.green_dark },
    AlphaShortcut = { fg = palette.purple_lite },
  }
end

return M
