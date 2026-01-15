local M = {}

local function load_integrations(palette, config, utilities, groups)
  local all_highlights = {}

  local integrations = {
    "alpha",
    "avante",
    "barbar",
    "blink",
    "dashboard-nvim",
    "devicons",
    "folke-plugins",
    "fzf-lua",
    "gitsigns",
    "grug-far",
    "indent-blankline",
    "lsp",
    "lualine",
    "markview",
    "mini",
    "modes",
    "neo-tree",
    "neogit",
    "neorg",
    "neotest",
    "nvim-cmp",
    "nvim-dap-ui",
    "nvim-navic",
    "nvim-notify",
    "nvim-tree",
    "nvim-treesitter-context",
    "rainbow-delimiters",
    "render-markdown",
    "telescope",
    "treesitter",
    "vim-illuminate",
    "vim-sneak",
    "vimwiki",
  }

  for _, name in ipairs(integrations) do
    local ok, integration = pcall(require, "gruvbox.integrations." .. name)
    if ok and integration.setup then
      local highlights = integration.setup(palette, config, utilities, groups)
      if highlights then
        for group, highlight in pairs(highlights) do
          all_highlights[group] = highlight
        end
      end
    end
  end

  return all_highlights
end

local config = require("gruvbox.config")

local function set_highlights()
  local utilities = require("gruvbox.utilities")
  local palette = require("gruvbox.palette")
  local styles = config.options.styles

  local groups = {}
  for group, color in pairs(config.options.groups) do
    groups[group] = utilities.parse_color(color)
  end

  local highlights = {}

  local default_highlights = {
    Normal = { fg = palette.fg, bg = palette.bg_main },
    NormalFloat = { fg = palette.fg, bg = palette.bg_main },
    NormalNC = { fg = palette.fg2, bg = palette.bg_main },
    Directory = { fg = palette.blue_dark, bold = styles.bold },
    Title = { fg = palette.aqua_lite, bold = styles.bold },
    FloatBorder = utilities.make_border(palette.gray, config, palette, styles),
    FloatTitle = { fg = palette.aqua_lite, bg = palette.bg_second, bold = styles.bold },
    Folded = { fg = palette.purple_lite, bg = palette.bg_main },
    FoldColumn = { fg = palette.gray },
    MatchParen = { bg = palette.bg4, bold = styles.bold },
    QuickFixLine = { bg = palette.bg1, bold = styles.bold },
    WildMenu = { link = "IncSearch" },
    Conceal = { bg = palette.none },
    SignColumn = { fg = palette.fg, bg = palette.none },
    ColorColumn = { bg = palette.bg_second },
    VertSplit = { fg = palette.bg1 },
    WinSeparator = { fg = palette.bg1 },
    NonText = { fg = palette.gray },
    SpecialKey = { fg = palette.orange_dark },
    Cursor = { fg = palette.bg_main, bg = palette.fg1 },
    CursorColumn = { bg = palette.bg_second },
    CursorLine = { bg = palette.bg_second },
    CursorLineNr = { fg = palette.yellow_lite, bold = styles.bold },
    LineNr = { fg = palette.gray },
    Search = { fg = palette.bg_main, bg = palette.yellow_lite },
    CurSearch = { fg = palette.bg_main, bg = palette.yellow_dark },
    IncSearch = { fg = palette.bg_main, bg = palette.yellow_dark },
    Substitute = { fg = palette.bg_main, bg = palette.orange_dark },
    Pmenu = { fg = palette.fg1, bg = palette.bg_main },
    PmenuSel = { fg = palette.green_lite, bg = palette.bg_third },
    PmenuKind = { fg = palette.aqua_lite, bg = palette.bg_second },
    PmenuKindSel = { fg = palette.aqua_lite, bg = palette.bg1 },
    PmenuSbar = { bg = palette.bg_second },
    PmenuThumb = { bg = palette.gray },
    PmenuExtra = { fg = palette.fg2, bg = palette.bg_second },
    PmenuExtraSel = { fg = palette.fg1, bg = palette.bg1 },
    DiffAdd = { bg = palette.green_dark, blend = 20 },
    DiffChange = { bg = palette.yellow_dark, blend = 20 },
    DiffDelete = { bg = palette.red_dark, blend = 20 },
    DiffText = { bg = palette.blue_dark, blend = 40 },
    diffAdded = { link = "DiffAdd" },
    diffChanged = { link = "DiffChange" },
    diffRemoved = { link = "DiffDelete" },
    ErrorMsg = { fg = palette.red_dark, bold = styles.bold },
    WarningMsg = { fg = palette.yellow_dark, bold = styles.bold },
    ModeMsg = { fg = palette.fg2 },
    MoreMsg = { fg = palette.purple_lite },
    Question = { fg = palette.yellow_lite },
    NvimInternalError = { link = "ErrorMsg" },
    Visual = { bg = palette.bg2 },
    SpellBad = { sp = palette.red_dark, undercurl = true },
    SpellCap = { sp = palette.yellow_lite, undercurl = true },
    SpellLocal = { sp = palette.blue_lite, undercurl = true },
    SpellRare = { sp = palette.purple_lite, undercurl = true },
    StatusLine = { fg = palette.fg1, bg = palette.bg_second },
    StatusLineNC = { fg = palette.gray, bg = palette.bg_third },
    StatusLineTerm = { fg = palette.bg_main, bg = palette.blue_lite },
    StatusLineTermNC = { fg = palette.bg_main, bg = palette.gray },
    TabLine = { fg = palette.fg4, bg = palette.bg_second },
    TabLineFill = { bg = palette.bg_second },
    TabLineSel = { fg = palette.fg, bg = palette.bg2, bold = styles.bold },
    WinBar = { fg = palette.fg2, bg = palette.bg_main },
    WinBarNC = { fg = palette.gray, bg = palette.bg_second },
    DiagnosticError = { fg = groups.error },
    DiagnosticHint = { fg = groups.hint },
    DiagnosticInfo = { fg = groups.info },
    DiagnosticOk = { fg = groups.ok },
    DiagnosticWarn = { fg = groups.warn },
    DiagnosticDefaultError = { link = "DiagnosticError" },
    DiagnosticDefaultHint = { link = "DiagnosticHint" },
    DiagnosticDefaultInfo = { link = "DiagnosticInfo" },
    DiagnosticDefaultOk = { link = "DiagnosticOk" },
    DiagnosticDefaultWarn = { link = "DiagnosticWarn" },
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingHint = { link = "DiagnosticHint" },
    DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
    DiagnosticFloatingOk = { link = "DiagnosticOk" },
    DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignOk = { link = "DiagnosticOk" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticUnderlineError = { sp = groups.error, undercurl = true },
    DiagnosticUnderlineHint = { sp = groups.hint, undercurl = true },
    DiagnosticUnderlineInfo = { sp = groups.info, undercurl = true },
    DiagnosticUnderlineOk = { sp = groups.ok, undercurl = true },
    DiagnosticUnderlineWarn = { sp = groups.warn, undercurl = true },
    DiagnosticVirtualTextError = { fg = groups.error, bg = groups.error, blend = 10 },
    DiagnosticVirtualTextHint = { fg = groups.hint, bg = groups.hint, blend = 10 },
    DiagnosticVirtualTextInfo = { fg = groups.info, bg = groups.info, blend = 10 },
    DiagnosticVirtualTextOk = { fg = groups.ok, bg = groups.ok, blend = 10 },
    DiagnosticVirtualTextWarn = { fg = groups.warn, bg = groups.warn, blend = 10 },
    Boolean = { fg = palette.orange_lite },
    Character = { fg = palette.red_lite },
    Comment = { fg = palette.fg2, italic = true },
    Conditional = { fg = palette.purple_lite },
    Constant = { fg = palette.orange_lite },
    Debug = { fg = palette.purple_lite },
    Define = { fg = palette.purple_lite },
    Delimiter = { fg = palette.orange_dark },
    Error = { fg = palette.red_lite },
    Exception = { fg = palette.blue_lite },
    Float = { fg = palette.orange_lite },
    Function = { fg = palette.blue_lite },
    Identifier = { fg = palette.red_lite },
    Include = { fg = palette.blue_lite },
    Keyword = { fg = palette.purple_lite },
    Label = { fg = palette.yellow_lite },
    Macro = { fg = palette.purple_dark },
    Number = { fg = palette.orange_lite },
    Operator = { fg = palette.fg2, sp = "none" },
    PreCondit = { fg = palette.yellow_lite },
    PreProc = { link = "PreCondit" },
    Repeat = { fg = palette.yellow_lite },
    Special = { fg = palette.aqua_lite },
    SpecialChar = { link = "Special" },
    SpecialComment = { fg = palette.purple_dark },
    Statement = { fg = palette.red_lite, bold = styles.bold },
    StorageClass = { fg = palette.yellow_lite },
    String = { fg = palette.green_lite },
    Structure = { fg = palette.purple_lite },
    Tag = { fg = palette.yellow_lite },
    Todo = { fg = palette.yellow_lite, bg = palette.bg_second, bold = styles.bold },
    Type = { fg = palette.yellow_lite, sp = "none" },
    TypeDef = { link = "Type" },
    Underlined = { fg = palette.purple_dark, underline = true },
    healthError = { fg = groups.error },
    healthSuccess = { fg = groups.info },
    healthWarning = { fg = groups.warn },

    htmlArg = { fg = palette.purple_lite },
    htmlBold = { bold = styles.bold },
    htmlEndTag = { fg = palette.gray },
    htmlH1 = { link = "markdownH1" },
    htmlH2 = { link = "markdownH2" },
    htmlH3 = { link = "markdownH3" },
    htmlH4 = { link = "markdownH4" },
    htmlH5 = { link = "markdownH5" },
    htmlItalic = { italic = true },
    htmlLink = { link = "markdownUrl" },
    htmlTag = { fg = palette.gray },
    htmlTagN = { fg = palette.fg },
    htmlTagName = { fg = palette.aqua_lite },
    markdownDelimiter = { fg = palette.gray },
    markdownH1 = { fg = palette.red_dark, bold = styles.bold },
    markdownH1Delimiter = { link = "markdownH1" },
    markdownH2 = { fg = palette.yellow_dark, bold = styles.bold },
    markdownH2Delimiter = { link = "markdownH2" },
    markdownH3 = { fg = palette.green_dark, bold = styles.bold },
    markdownH3Delimiter = { link = "markdownH3" },
    markdownH4 = { fg = palette.aqua_dark, bold = styles.bold },
    markdownH4Delimiter = { link = "markdownH4" },
    markdownH5 = { fg = palette.blue_dark, bold = styles.bold },
    markdownH5Delimiter = { link = "markdownH5" },
    markdownH6 = { fg = palette.aqua_dark, bold = styles.bold },
    markdownH6Delimiter = { link = "markdownH6" },
    markdownLinkText = { link = "markdownUrl" },
    markdownUrl = { fg = palette.blue_lite, underline = true },
    mkdCode = { fg = palette.aqua_lite, italic = true },
    mkdCodeDelimiter = { fg = palette.red_lite },
    mkdCodeEnd = { fg = palette.aqua_lite },
    mkdCodeStart = { fg = palette.aqua_lite },
    mkdFootnotes = { fg = palette.aqua_lite },
    mkdID = { fg = palette.aqua_lite, underline = true },
    mkdInlineURL = { link = "markdownUrl" },
    mkdLink = { link = "markdownUrl" },
    mkdLinkDef = { link = "markdownUrl" },
    mkdListItemLine = { fg = palette.fg },
    mkdRule = { fg = palette.gray },
    mkdURL = { link = "markdownUrl" },
  }

  local transparency_highlights = {
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextOk = { fg = groups.ok },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    FloatBorder = utilities.make_border(palette.fg4, config, palette, styles),
    FloatTitle = { fg = palette.aqua_lite, bg = palette.none, bold = styles.bold },
    Folded = { fg = palette.fg, bg = palette.none },
    NormalFloat = { bg = palette.none },
    Normal = { fg = palette.fg, bg = palette.none },
    NormalNC = { fg = palette.fg2, bg = config.options.dim_inactive_windows and palette.bg_main or "NONE" },
    Pmenu = { fg = palette.fg, bg = palette.none },
    PmenuKind = { fg = palette.aqua_lite, bg = palette.none },
    SignColumn = { fg = palette.fg, bg = palette.none },
    StatusLine = { fg = palette.fg1, bg = palette.bg_second },
    StatusLineNC = { fg = palette.fg4, bg = palette.none },
    TabLine = { bg = palette.none, fg = palette.gray },
    TabLineFill = { bg = palette.none },
    TabLineSel = { fg = palette.fg, bg = palette.none, bold = styles.bold },

    ["@markup.raw.markdown_inline"] = { fg = palette.yellow_lite },

    TelescopeNormal = { fg = palette.gray, bg = palette.none },
    TelescopePromptNormal = { fg = palette.fg, bg = palette.none },
    TelescopeSelection = { fg = palette.fg, bg = palette.none, bold = styles.bold },
    TelescopeSelectionCaret = { fg = palette.purple_lite },

    TroubleNormal = { bg = palette.none },

    WhichKeyFloat = { bg = palette.none },
    WhichKeyNormal = { bg = palette.none },

    IblIndent = { fg = palette.bg3, bg = palette.none },
    IblScope = { fg = palette.aqua_lite, bg = palette.none },
    IblWhitespace = { fg = palette.bg3, bg = palette.none },

    TreesitterContext = { bg = palette.none },
    TreesitterContextLineNumber = { fg = palette.purple_lite, bg = palette.none },

    MiniFilesTitleFocused = { fg = palette.purple_lite, bg = palette.none, bold = styles.bold },

    MiniPickPrompt = { bg = palette.none, bold = styles.bold },
    MiniPickBorderText = utilities.make_border(groups.border, config, palette, styles),
  }

  for group, highlight in pairs(default_highlights) do
    highlights[group] = highlight
  end

  local integration_highlights = load_integrations(palette, config, utilities, groups)
  for group, highlight in pairs(integration_highlights) do
    highlights[group] = highlight
  end

  if styles.transparency then
    for group, highlight in pairs(transparency_highlights) do
      highlights[group] = highlight
    end
  end

  -- Reconcile highlights with config
  if config.options.highlight_groups ~= nil and next(config.options.highlight_groups) ~= nil then
    for group, highlight in pairs(config.options.highlight_groups) do
      local existing = highlights[group] or {}
      -- Traverse link due to
      -- "If link is used in combination with other attributes; only the link will take effect"
      -- see: https://neovim.io/doc/user/api.html#nvim_set_hl()
      while existing.link ~= nil do
        existing = highlights[existing.link] or {}
      end
      local parsed = vim.tbl_extend("force", {}, highlight)

      if highlight.fg ~= nil then
        parsed.fg = utilities.parse_color(highlight.fg) or highlight.fg
      end
      if highlight.bg ~= nil then
        parsed.bg = utilities.parse_color(highlight.bg) or highlight.bg
      end
      if highlight.sp ~= nil then
        parsed.sp = utilities.parse_color(highlight.sp) or highlight.sp
      end

      if (highlight.inherit == nil or highlight.inherit) and existing ~= nil then
        parsed.inherit = nil
        highlights[group] = vim.tbl_extend("force", existing, parsed)
      else
        parsed.inherit = nil
        highlights[group] = parsed
      end
    end
  end

  for group, highlight in pairs(highlights) do
    if config.options.before_highlight ~= nil then
      config.options.before_highlight(group, highlight, palette)
    end

    if highlight.blend ~= nil and (highlight.blend >= 0 and highlight.blend <= 100) and highlight.bg ~= nil then
      highlight.bg = utilities.blend(highlight.bg, highlight.blend_on or palette.bg_second, highlight.blend / 100)
    end

    highlight.blend = nil
    highlight.blend_on = nil

    vim.api.nvim_set_hl(0, group, highlight)
  end

  --- Terminal
  if config.options.enable.terminal then
    vim.g.terminal_color_0 = palette.bg_main      -- black
    vim.g.terminal_color_8 = palette.bg_third     -- bright black
    vim.g.terminal_color_1 = palette.red_dark     -- red
    vim.g.terminal_color_9 = palette.red_lite     -- bright red
    vim.g.terminal_color_2 = palette.green_dark   -- green
    vim.g.terminal_color_10 = palette.green_lite  -- bright green
    vim.g.terminal_color_3 = palette.yellow_dark  -- yellow
    vim.g.terminal_color_11 = palette.yellow_lite -- bright yellow
    vim.g.terminal_color_4 = palette.blue_dark    -- blue
    vim.g.terminal_color_12 = palette.blue_lite   -- bright blue
    vim.g.terminal_color_5 = palette.purple_dark  -- magenta
    vim.g.terminal_color_13 = palette.purple_lite -- bright magenta
    vim.g.terminal_color_6 = palette.aqua_dark    -- cyan
    vim.g.terminal_color_14 = palette.aqua_lite   -- bright cyan
    vim.g.terminal_color_7 = palette.fg1          -- white
    vim.g.terminal_color_15 = palette.fg          -- bright white

    -- Support StatusLineTerm & StatusLineTermNC from vim
    vim.cmd([[
		augroup gruvbox
			autocmd!
			autocmd TermOpen * if &buftype=='terminal'
				\|setlocal winhighlight=StatusLine:StatusLineTerm,StatusLineNC:StatusLineTermNC
				\|else|setlocal winhighlight=|endif
			autocmd ColorSchemePre * autocmd! gruvbox
		augroup END
		]])
  end
end

---@param variant Variant | nil
function M.colorscheme(variant)
  config.extend_options({ variant = variant })

  vim.opt.termguicolors = true
  if vim.g.colors_name then
    vim.cmd("hi clear")
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "gruvbox"

  if variant == "light" then
    vim.o.background = "light"
  elseif variant == "hard" or variant == "medium" or variant == "soft" then
    vim.o.background = "dark"
  end

  set_highlights()
end

---@param options Options
function M.setup(options)
  config.extend_options(options or {})
end

return M
