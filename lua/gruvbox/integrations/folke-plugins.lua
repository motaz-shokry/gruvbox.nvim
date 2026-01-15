local M = {}

function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  return {
    -- folke/flash.nvim
    FlashLabel = { fg = palette.bg_main, bg = palette.red_lite },

    -- folke/which-key.nvim
    WhichKey = { fg = palette.purple_lite },
    WhichKeyBorder = utilities.make_border(groups.border, config, palette, styles),
    WhichKeyDesc = { fg = palette.yellow_lite },
    WhichKeyFloat = { bg = groups.panel },
    WhichKeyGroup = { fg = palette.aqua_lite },
    WhichKeyIcon = { fg = palette.green_dark },
    WhichKeyIconAzure = { fg = palette.green_dark },
    WhichKeyIconBlue = { fg = palette.green_dark },
    WhichKeyIconCyan = { fg = palette.aqua_lite },
    WhichKeyIconGreen = { fg = palette.green_lite },
    WhichKeyIconGrey = { fg = palette.gray },
    WhichKeyIconOrange = { fg = palette.purple_lite },
    WhichKeyIconPurple = { fg = palette.purple_lite },
    WhichKeyIconRed = { fg = palette.red_lite },
    WhichKeyIconYellow = { fg = palette.yellow_lite },
    WhichKeyNormal = { link = "NormalFloat" },
    WhichKeySeparator = { fg = palette.gray },
    WhichKeyTitle = { link = "FloatTitle" },
    WhichKeyValue = { fg = palette.purple_lite },

    -- folke/noice.nvim
    NoiceCursor = { fg = palette.highlight_high, bg = palette.fg },

    -- folke/trouble.nvim
    TroubleText = { fg = palette.gray },
    TroubleCount = { fg = palette.purple_lite, bg = palette.bg_second },

    -- folke/snacks.nvim
    SnacksIndent = { fg = palette.bg3 },
    SnacksIndentChunk = { fg = palette.bg3 },
    SnacksIndentBlank = { fg = palette.bg3 },
    SnacksIndentScope = { fg = palette.aqua_lite },
    SnacksPickerMatch = { fg = palette.purple_lite, bold = styles.bold },

  }
end

return M
