-- nvimdev/dashboard-nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    DashboardHeader = { fg = palette.yellow_dark },
    DashboardCenter = { fg = palette.aqua_lite },
    DashboardFooter = { fg = palette.purple_lite },
    DashboardShortcut = { fg = palette.red_lite },
  }
end

return M

