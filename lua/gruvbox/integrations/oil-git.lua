-- malewicz1337/oil-git.nvim
local M = {}

function M.setup(palette, config, utilities, groups)
  local highlights = {}

  highlights["OilGitAdded"] = { fg = groups.git_add }
  highlights["OilGitModified"] = { fg = groups.git_change }
  highlights["OilGitRenamed"] = { fg = groups.git_rename }
  highlights["OilGitDeleted"] = { fg = groups.git_delete }
  highlights["OilGitCopied"] = { fg = groups.git_rename }
  highlights["OilGitConflict"] = { fg = groups.git_merge }
  highlights["OilGitUntracked"] = { fg = palette.gray }
  highlights["OilGitIgnored"] = { fg = groups.git_ignore }

  return highlights
end

return M
