-- NeogitOrg/neogit
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    -- https://github.com/NeogitOrg/neogit/blob/master/lua/neogit/lib/hl.lua#L109-L198
    NeogitChangeAdded = { fg = groups.git_add, bold = styles.bold, italic = styles.italic },
    NeogitChangeBothModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
    NeogitChangeCopied = { fg = groups.git_untracked, bold = styles.bold, italic = styles.italic },
    NeogitChangeDeleted = { fg = groups.git_delete, bold = styles.bold, italic = styles.italic },
    NeogitChangeModified = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
    NeogitChangeNewFile = { fg = groups.git_stage, bold = styles.bold, italic = styles.italic },
    NeogitChangeRenamed = { fg = groups.git_rename, bold = styles.bold, italic = styles.italic },
    NeogitChangeUpdated = { fg = groups.git_change, bold = styles.bold, italic = styles.italic },
    NeogitDiffAddHighlight = { link = "DiffAdd" },
    NeogitDiffContextHighlight = { bg = palette.bg_second },
    NeogitDiffDeleteHighlight = { link = "DiffDelete" },
    NeogitFilePath = { fg = palette.aqua_lite, italic = styles.italic },
    NeogitHunkHeader = { bg = groups.panel },
    NeogitHunkHeaderHighlight = { bg = groups.panel },

  }
end

return M
