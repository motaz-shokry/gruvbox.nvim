local M = {}

function M.setup(palette, config)
  if not config.options.enable.lualine then
    return {}
  end

  local bg_base = palette.bg_second
  if config.options.styles.transparency then
    bg_base = "NONE"
  end

  local theme = {
    normal = {
      a = { bg = palette.bg_third, fg = palette.blue_lite, gui = "bold" },
      b = { bg = bg_base, fg = palette.fg2 },
      c = { bg = bg_base, fg = palette.fg2 },
      x = { bg = bg_base, fg = palette.aqua_dark },
      y = { bg = bg_base, fg = palette.yellow_dark },
      z = { bg = bg_base, fg = palette.blue_dark },
    },
    insert = {
      a = { bg = palette.bg_third, fg = palette.green_lite, gui = "bold" },
      b = { bg = bg_base, fg = palette.fg2 },
      c = { bg = bg_base, fg = palette.fg2 },
      x = { bg = bg_base, fg = palette.aqua_dark },
      y = { bg = bg_base, fg = palette.yellow_dark },
      z = { bg = bg_base, fg = palette.blue_dark },
    },
    visual = {
      a = { bg = palette.bg_third, fg = palette.yellow_lite, gui = "bold" },
      b = { bg = bg_base, fg = palette.fg2 },
      c = { bg = bg_base, fg = palette.fg2 },
      x = { bg = bg_base, fg = palette.aqua_dark },
      y = { bg = bg_base, fg = palette.yellow_dark },
      z = { bg = bg_base, fg = palette.blue_dark },
    },
    replace = {
      a = { bg = palette.bg_third, fg = palette.orange_lite, gui = "bold" },
      b = { bg = bg_base, fg = palette.fg2 },
      c = { bg = bg_base, fg = palette.fg2 },
      x = { bg = bg_base, fg = palette.aqua_dark },
      y = { bg = bg_base, fg = palette.yellow_dark },
      z = { bg = bg_base, fg = palette.blue_dark },
    },
    command = {
      a = { bg = palette.bg_third, fg = palette.purple_lite, gui = "bold" },
      b = { bg = bg_base, fg = palette.fg2 },
      c = { bg = bg_base, fg = palette.fg2 },
      x = { bg = bg_base, fg = palette.aqua_dark },
      y = { bg = bg_base, fg = palette.yellow_dark },
      z = { bg = bg_base, fg = palette.blue_dark },
    },
    inactive = {
      a = { bg = palette.bg_third, fg = palette.gray, gui = "bold" },
      b = { bg = bg_base, fg = palette.gray },
      c = { bg = bg_base, fg = palette.gray },
      x = { bg = bg_base, fg = palette.aqua_dark },
      y = { bg = bg_base, fg = palette.yellow_dark },
      z = { bg = bg_base, fg = palette.blue_dark },
    },
  }

  local ok, lualine = pcall(require, "lualine")
  if ok then
    lualine.setup({
      options = {
        theme = theme,
      }
    })
  end

  return {}
end

return M
