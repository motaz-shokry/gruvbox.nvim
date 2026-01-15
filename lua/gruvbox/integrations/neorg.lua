-- nvim-neorg/neorg
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
    NeorgHeading1Title = { link = "markdownH1" },
    NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
    NeorgHeading2Title = { link = "markdownH2" },
    NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
    NeorgHeading3Title = { link = "markdownH3" },
    NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
    NeorgHeading4Title = { link = "markdownH4" },
    NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
    NeorgHeading5Title = { link = "markdownH5" },
    NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
    NeorgHeading6Title = { link = "markdownH6" },
    NeorgMarkerTitle = { fg = palette.aqua_lite, bold = styles.bold },
  }
end

return M
