-- lewis6991/gitsigns.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    GitSignsAdd = { fg = groups.git_add, bg = palette.none },
    GitSignsChange = { fg = groups.git_change, bg = palette.none },
    GitSignsDelete = { fg = groups.git_delete, bg = palette.none },
    SignAdd = { fg = groups.git_add, bg = palette.none },
    SignChange = { fg = groups.git_change, bg = palette.none },
    SignDelete = { fg = groups.git_delete, bg = palette.none },
  }
end

return M
