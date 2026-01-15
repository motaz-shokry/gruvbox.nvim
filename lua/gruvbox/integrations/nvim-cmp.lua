-- hrsh7th/nvim-cmp
local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    CmpItemAbbr = { fg = palette.gray },
    CmpItemAbbrDeprecated = { fg = palette.gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = palette.fg, bold = styles.bold },
    CmpItemAbbrMatchFuzzy = { fg = palette.fg, bold = styles.bold },
    CmpItemKind = { fg = palette.gray },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },
  }
end

return M
