-- romgrk/barbar.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    BufferCurrent = { fg = palette.fg, bg = palette.bg_main },
    BufferCurrentIndex = { fg = palette.blue_lite, bg = palette.bg_main },
    BufferCurrentMod = { fg = palette.aqua_lite, bg = palette.bg_main },
    BufferCurrentSign = { fg = palette.gray, bg = palette.bg_main },
    BufferCurrentTarget = { fg = palette.yellow_lite, bg = palette.bg_main },
    BufferCurrentCHANGED = { fg = groups.git_change, bg = palette.bg_main },
    BufferCurrentDELETED = { fg = groups.git_delete, bg = palette.bg_main },
    BufferCurrentADDED = { fg = groups.git_add, bg = palette.bg_main },
    BufferCurrentHINT = { fg = groups.hint, bg = palette.bg_main },
    BufferCurrentERROR = { fg = groups.error, bg = palette.bg_main },
    BufferCurrentINFO = { fg = groups.info, bg = palette.bg_main },
    BufferCurrentWARN = { fg = groups.warn, bg = palette.bg_main },
    BufferInactive = { fg = palette.gray },
    BufferInactiveIndex = { fg = palette.gray },
    BufferInactiveMod = { fg = palette.aqua_lite },
    BufferInactiveSign = { fg = palette.gray },
    BufferInactiveTarget = { fg = palette.yellow_lite },
    BufferTabpageFill = { fg = "NONE", bg = palette.none },
    BufferVisible = { fg = palette.gray },
    BufferVisibleIndex = { fg = palette.gray },
    BufferVisibleMod = { fg = palette.aqua_lite },
    BufferVisibleSign = { fg = palette.fg4 },
    BufferVisibleTarget = { fg = palette.yellow_lite },
    BufferOffset = { fg = palette.green_lite, bg = palette.bg_main },
  }
end

return M
