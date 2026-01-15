-- kyazdani42/nvim-tree.lua
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    NvimTreeEmptyFolderName = { fg = palette.fg4 },
    NvimTreeFileDeleted = { fg = groups.git_delete },
    NvimTreeFileDirty = { fg = groups.git_dirty },
    NvimTreeFileMerge = { fg = groups.git_merge },
    NvimTreeFileNew = { fg = palette.aqua_lite },
    NvimTreeFileRenamed = { fg = groups.git_rename },
    NvimTreeFileStaged = { fg = groups.git_stage },
    NvimTreeFolderIcon = { fg = palette.gray },
    NvimTreeFolderName = { fg = palette.aqua_lite },
    NvimTreeGitDeleted = { fg = groups.git_delete },
    NvimTreeGitDirty = { fg = groups.git_dirty },
    NvimTreeGitIgnored = { fg = groups.git_ignore },
    NvimTreeGitMerge = { fg = groups.git_merge },
    NvimTreeGitNew = { fg = groups.git_add },
    NvimTreeGitRenamed = { fg = groups.git_rename },
    NvimTreeGitStaged = { fg = groups.git_stage },
    NvimTreeImageFile = { fg = palette.fg },
    NvimTreeNormal = { link = "Normal" },
    NvimTreeOpenedFile = { fg = palette.fg, bg = palette.bg2 },
    NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
    NvimTreeRootFolder = { fg = palette.aqua_lite, bold = styles.bold },
    NvimTreeSpecialFile = { link = "NvimTreeNormal" },
    NvimTreeWindowPicker = { link = "StatusLineTerm" },
  }
end

return M
