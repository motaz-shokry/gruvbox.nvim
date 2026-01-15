-- MeanderingProgrammer/render-markdown.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    RenderMarkdownBullet = { fg = palette.purple_lite },
    RenderMarkdownChecked = { fg = palette.aqua_lite },
    RenderMarkdownCode = { bg = palette.bg_second },
    RenderMarkdownCodeInline = { fg = palette.fg1, bg = palette.bg_third },
    RenderMarkdownDash = { fg = palette.fg4 },
    RenderMarkdownH1Bg = { bg = groups.h1, blend = 20 },
    RenderMarkdownH2Bg = { bg = groups.h2, blend = 20 },
    RenderMarkdownH3Bg = { bg = groups.h3, blend = 20 },
    RenderMarkdownH4Bg = { bg = groups.h4, blend = 20 },
    RenderMarkdownH5Bg = { bg = groups.h5, blend = 20 },
    RenderMarkdownH6Bg = { bg = groups.h6, blend = 20 },
    RenderMarkdownQuote = { fg = palette.gray },
    RenderMarkdownTableFill = { link = "Conceal" },
    RenderMarkdownTableHead = { fg = palette.gray },
    RenderMarkdownTableRow = { fg = palette.gray },
    RenderMarkdownUnchecked = { fg = palette.gray },
  }
end

return M

