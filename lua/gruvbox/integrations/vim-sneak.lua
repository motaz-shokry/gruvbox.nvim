-- justinmk/vim-sneak
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    Sneak = { fg = palette.bg_main, bg = palette.red_lite },
    SneakCurrent = { link = "StatusLineTerm" },
    SneakScope = { link = "IncSearch" },
  }
end

return M

