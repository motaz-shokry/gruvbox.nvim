-- nvim-treesitter/nvim-treesitter-context
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    TreesitterContext = { bg = palette.bg3 },
    TreesitterContextLineNumber = { fg = palette.purple_lite, bg = palette.bg3 },
  }
end

return M

