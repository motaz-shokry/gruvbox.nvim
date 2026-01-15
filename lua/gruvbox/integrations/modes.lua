-- mvllow/modes.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    ModesCopy = { bg = palette.yellow_lite },
    ModesDelete = { bg = palette.red_lite },
    ModesFormat = { bg = palette.blue_lite },
    ModesInsert = { bg = palette.green_lite },
    ModesReplace = { bg = palette.aqua_lite },
    ModesVisual = { bg = palette.fg4 },
  }
end

return M

