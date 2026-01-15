-- rcarriga/nvim-notify
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    NotifyBackground = { link = "NormalFloat" },
    NotifyDEBUGBody = { link = "NormalFloat" },
    NotifyDEBUGBorder = utilities.make_border(groups.border, config, palette, styles),
    NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
    NotifyDEBUGTitle = { fg = palette.fg4 },
    NotifyERRORBody = { link = "NormalFloat" },
    NotifyERRORBorder = utilities.make_border(groups.error, config, palette, styles),
    NotifyERRORIcon = { link = "NotifyERRORTitle" },
    NotifyERRORTitle = { fg = groups.error },
    NotifyINFOBody = { link = "NormalFloat" },
    NotifyINFOBorder = utilities.make_border(groups.info, config, palette, styles),
    NotifyINFOIcon = { link = "NotifyINFOTitle" },
    NotifyINFOTitle = { fg = groups.info },
    NotifyTRACEBody = { link = "NormalFloat" },
    NotifyTRACEBorder = utilities.make_border(palette.purple_lite, config, palette, styles),
    NotifyTRACEIcon = { link = "NotifyTRACETitle" },
    NotifyTRACETitle = { fg = palette.purple_lite },
    NotifyWARNBody = { link = "NormalFloat" },
    NotifyWARNBorder = utilities.make_border(groups.warn, config, palette, styles),
    NotifyWARNIcon = { link = "NotifyWARNTitle" },
    NotifyWARNTitle = { fg = groups.warn },
  }
end

return M
