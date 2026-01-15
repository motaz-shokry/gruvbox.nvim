-- nvim-neo-tree/neo-tree.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  return {
    NeoTreeGitAdded = { fg = groups.git_add },
    NeoTreeGitConflict = { fg = groups.git_merge },
    NeoTreeGitDeleted = { fg = groups.git_delete },
    NeoTreeGitIgnored = { fg = groups.git_ignore },
    NeoTreeGitModified = { fg = groups.git_change },
    NeoTreeGitRenamed = { fg = groups.git_rename },
    NeoTreeGitUntracked = { fg = groups.git_untracked },
    NeoTreeTabActive = { fg = palette.text, bg = palette.bg2 },
    NeoTreeTabInactive = { fg = palette.gray },
    NeoTreeTabSeparatorActive = { link = "WinSeparator" },
    NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
    NeoTreeTitleBar = { link = "StatusLineTerm" },
  }
end

return M
