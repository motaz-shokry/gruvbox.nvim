---@alias Variant "hard" | "medium" | "soft" | "light"
---@alias Palette {bg_main: string, bg_second: string, bg_third: string, bg1: string, bg2: string, bg3: string, bg4: string, fg: string, fg1: string, fg2: string, fg3: string, fg4: string, gray: string , red_dark: string, red_lite: string, green_dark: string, green_lite: string, yellow_dark: string, yellow_lite: string, blue_dark: string, blue_lite: string, purple_dark: string, pruple_lite: string, aqua_dark:string, aqua_lite: string, orange_dark: string, orange_lite: string}
---@alias PaletteColor "bg_main" | "bg_second" | "bg_third" | "bg1" | "bg2" | "bg3" | "bg4" | "fg" | "fg1" | "fg2" | "fg3" | "fg4" | "gray" | "red_dark" | "red_lite" | "green_dark" | "green_lite" | "yellow_dark" | "yellow_lite" | "blue_dark" | "blue_lite" | "pruple_dark" | "purple_lite" | "aqua_dark" | "aqua_lite" | "orange_dark" | "orange_lite" | "highlight_low" | "highlight_med" | "highlight_high"
---@alias Highlight { link: string, inherit: boolean } | { fg: string, bg: string, sp: string, bold: boolean, italic: boolean, undercurl: boolean, underline: boolean, underdouble: boolean, underdotted: boolean, underdashed: boolean, strikethrough: boolean, inherit: boolean }

local config = {}

---@class Options
config.options = {
  ---Set the desired variant: "auto" will follow the vim background,
  ---defaulting to `dark_variant` or "hard" for deep dark and "soft" for lite dark and "light" for light.
  ---@type "auto" | Variant
  variant = "auto",

  ---Set the desired dark variant when `options.variant` is set to "auto".
  ---@type Variant
  dark_variant = "medium",

  ---Differentiate between active and inactive windows and panels.
  dim_inactive_windows = false,

  ---Extend background behind borders. Appearance differs based on which
  ---border characters you are using.
  extend_background_behind_borders = false,

  enable = {
    legacy_highlights = true,
    migrations = true,
    terminal = true,
  },

  styles = {
    bold = true,
    italic = true,
    transparency = false,
  },

  ---@type table<string, table<string, string>>
  palette = {},

  ---@type table<string, string | PaletteColor>
  groups = {
    -- UI Elements
    border = "fg4",
    link = "purple_lite",
    panel = "bg_second",

    -- Diagnostic levels
    error = "red_lite",
    hint = "aqua_lite",
    info = "blue_lite",
    ok = "green_lite",
    warn = "yellow_lite",
    note = "yellow_dark",
    todo = "aqua_dark",

    -- Git states
    git_add = "green_dark",
    git_change = "yellow_dark",
    git_delete = "red_dark",
    git_dirty = "orange_dark",
    git_ignore = "gray",
    git_merge = "purple_dark",
    git_rename = "blue_dark",
    git_stage = "purple_dark",
    git_text = "yellow_lite",
    git_untracked = "bg2",

    -- Headings
    h1 = "red_dark",
    h2 = "yellow_dark",
    h3 = "green_dark",
    h4 = "aqua_dark",
    h5 = "blue_dark",
    h6 = "purple_dark",
  },

  ---@type table<string, Highlight>
  highlight_groups = {},

  ---Called before each highlight group, before setting the highlight.
  ---@param group string
  ---@param highlight Highlight
  ---@param palette Palette
  ---@diagnostic disable-next-line: unused-local
  before_highlight = function(group, highlight, palette) end,
}

local function migrate(options)
  if options.bold_vert_split then
    local border = options.groups.border or "gray"
    options.highlight_groups["VertSplit"] = { fg = border, bg = border }
    options.highlight_groups["WinSeparator"] = { fg = border, bg = border }
  end

  if options.disable_background then
    options.highlight_groups["Normal"] = { bg = "NONE" }
  end

  if options.disable_float_background then
    options.highlight_groups["NormalFloat"] = { bg = "NONE" }
  end

  options.dim_inactive_windows = options.dim_nc_background or options.dim_inactive_windows

  if options.groups.background ~= nil then
    options.highlight_groups["Normal"] = { bg = options.groups.background }
  end

  if options.groups.comment ~= nil then
    options.highlight_groups["Comment"] = { fg = options.groups.comment }
  end

  if options.groups.punctuation ~= nil then
    options.highlight_groups["@punctuation"] = { fg = options.groups.punctuation }
  end

  options.styles.transparency = (options.disable_background and options.disable_float_background)
      or options.styles.transparency

  -- These never actually existed, but may be set intuitively by the user
  -- because of `disable_italics` existing.
  options.styles.bold = not (options.disable_bold or options.disable_bolds) and options.styles.bold or false

  -- Similar to bold options, `disable_italic` never existed but could be a
  -- common typo of the actual `disable_italics`.
  options.styles.italic = not (options.disable_italic or options.disable_italics) and options.styles.italic or false

  -- Set h1 through h6 to the same color if only one is specified
  if type(options.groups.headings) == "string" then
    options.groups.h1 = options.groups.headings
    options.groups.h2 = options.groups.headings
    options.groups.h3 = options.groups.headings
    options.groups.h4 = options.groups.headings
    options.groups.h5 = options.groups.headings
    options.groups.h6 = options.groups.headings
  elseif options.groups.headings == "table" then
    options.groups.h1 = options.groups.headings.h1 or options.groups.h1
    options.groups.h2 = options.groups.headings.h2 or options.groups.h2
    options.groups.h3 = options.groups.headings.h3 or options.groups.h3
    options.groups.h4 = options.groups.headings.h4 or options.groups.h4
    options.groups.h5 = options.groups.headings.h5 or options.groups.h5
    options.groups.h6 = options.groups.headings.h6 or options.groups.h6
  end
  options.groups.headings = nil

  return options
end

---@param options Options | nil
function config.extend_options(options)
  config.options = vim.tbl_deep_extend("force", config.options, options or {})

  if config.options.enable.migrations then
    config.options = migrate(config.options)
  end
end

return config
