-- vimwiki/vimwiki
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    VimwikiHR = { fg = palette.gray },
    VimwikiHeader1 = { link = "markdownH1" },
    VimwikiHeader2 = { link = "markdownH2" },
    VimwikiHeader3 = { link = "markdownH3" },
    VimwikiHeader4 = { link = "markdownH4" },
    VimwikiHeader5 = { link = "markdownH5" },
    VimwikiHeader6 = { link = "markdownH6" },
    VimwikiHeaderChar = { fg = palette.gray },
    VimwikiLink = { link = "markdownUrl" },
    VimwikiList = { fg = palette.purple_dark },
    VimwikiNoExistsLink = { fg = palette.red_lite },
  }
end

return M
