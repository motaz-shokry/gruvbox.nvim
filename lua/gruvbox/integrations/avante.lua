-- yetone/avante.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    AvanteTitle = { fg = palette.highlight_high, bg = palette.purple_lite },
    AvanteReversedTitle = { fg = palette.purple_lite },
    AvanteSubtitle = { fg = palette.highlight_med, bg = palette.aqua_lite },
    AvanteReversedSubtitle = { fg = palette.aqua_lite },
    AvanteThirdTitle = { fg = palette.highlight_med, bg = palette.purple_lite },
    AvanteReversedThirdTitle = { fg = palette.purple_lite },
  }
end

return M
