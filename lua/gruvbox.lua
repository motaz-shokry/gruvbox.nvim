local M = {}
local config = require("gruvbox.config")

local function set_highlights()
  local utilities = require("gruvbox.utilities")
  local palette = require("gruvbox.palette")
  local styles = config.options.styles

  local groups = {}
  for group, color in pairs(config.options.groups) do
    groups[group] = utilities.parse_color(color)
  end

  local function make_border(fg)
    fg = fg or groups.border
    return {
      fg = fg,
      bg = (config.options.extend_background_behind_borders and not styles.transparency) and palette.bg_second
          or "NONE",
    }
  end

  local highlights = {}
  local legacy_highlights = {
    ["@attribute.diff"] = { fg = palette.orange_lite },
    ["@boolean"] = { fg = palette.orange_lite, bold = true },
    ["@class"] = { fg = palette.yellow_lite, bold = true },
    ["@conditional"] = { fg = palette.red_lite, italic = true },
    ["@field"] = { fg = palette.blue_lite },
    ["@include"] = { fg = palette.aqua_lite, bold = true },
    ["@interface"] = { fg = palette.yellow_dark, italic = true },
    ["@macro"] = { fg = palette.purple_dark, bold = true },
    ["@method"] = { fg = palette.blue_lite },
    ["@namespace"] = { fg = palette.orange_dark, italic = true },
    ["@number"] = { fg = palette.purple_lite },
    ["@parameter"] = { fg = palette.fg2, italic = styles.italic },
    ["@preproc"] = { fg = palette.red_dark, bold = true },
    ["@punctuation"] = { fg = palette.gray },
    ["@punctuation.bracket"] = { link = "@punctuation" },
    ["@punctuation.delimiter"] = { link = "@punctuation" },
    ["@punctuation.special"] = { fg = palette.orange_lite },
    ["@regexp"] = { fg = palette.green_lite },
    ["@repeat"] = { fg = palette.red_lite, italic = true },
    ["@storageclass"] = { fg = palette.blue_dark, bold = true },
    ["@symbol"] = { fg = palette.fg3 },
    ["@text"] = { fg = palette.fg1 },
    ["@text.danger"] = { fg = palette.red_lite, bold = true },
    ["@text.diff.add"] = { fg = palette.green_lite, bg = palette.green_dark, blend = 20 },
    ["@text.diff.delete"] = { fg = palette.red_lite, bg = palette.red_dark, blend = 20 },
    ["@text.emphasis"] = { italic = styles.italic },
    ["@text.environment"] = { fg = palette.aqua_dark, italic = true },
    ["@text.environment.name"] = { fg = palette.yellow_lite, bold = true },
    ["@text.math"] = { fg = palette.blue_lite, italic = true },
    ["@text.note"] = { fg = palette.aqua_lite, italic = true },
    ["@text.strike"] = { strikethrough = true, fg = palette.gray },
    ["@text.strong"] = { bold = styles.bold, fg = palette.fg },
    ["@text.title"] = { fg = groups.h1, bold = true },
    ["@text.title.1.markdown"] = { fg = groups.h1, bold = true },
    ["@text.title.1.marker.markdown"] = { fg = palette.red_lite },
    ["@text.title.2.markdown"] = { fg = groups.h2, bold = true },
    ["@text.title.2.marker.markdown"] = { fg = palette.yellow_lite },
    ["@text.title.3.markdown"] = { fg = groups.h3, bold = true },
    ["@text.title.3.marker.markdown"] = { fg = palette.green_lite },
    ["@text.title.4.markdown"] = { fg = groups.h4, bold = true },
    ["@text.title.4.marker.markdown"] = { fg = palette.aqua_lite },
    ["@text.title.5.markdown"] = { fg = groups.h5, bold = true },
    ["@text.title.5.marker.markdown"] = { fg = palette.blue_lite },
    ["@text.title.6.markdown"] = { fg = groups.h6, bold = true },
    ["@text.title.6.marker.markdown"] = { fg = palette.purple_lite },
    ["@text.underline"] = { underline = true, fg = palette.fg1 },
    ["@text.uri"] = { fg = palette.purple_lite, underline = true },
    ["@text.warning"] = { fg = palette.yellow_lite, bold = true },
    ["@todo"] = { fg = palette.yellow_dark, bg = palette.bg_third, bold = true, italic = true },

    -- lukas-reineke/indent-blankline.nvim
    IndentBlanklineChar = { fg = palette.bg2, nocombine = true },
    IndentBlanklineSpaceChar = { fg = palette.bg2, nocombine = true },
    IndentBlanklineSpaceCharBlankline = { fg = palette.bg2, nocombine = true },
  }
  local default_highlights = {
    -- Editor UI
    Normal = { fg = palette.fg, bg = palette.bg_main },
    NormalFloat = { bg = palette.bg_second },
    NormalNC = { fg = palette.fg, bg = palette.bg_main },

    Conceal = { bg = palette.none },
    SignColumn = { fg = palette.fg, bg = palette.none },
    ColorColumn = { bg = palette.bg_second },
    VertSplit = { fg = palette.bg1 },
    WinSeparator = { fg = palette.bg1 },
    NonText = { fg = palette.gray },
    SpecialKey = { fg = palette.aqua_lite },

    -- Cursor & Line Highlighting
    Cursor = { fg = palette.bg_main, bg = palette.fg },
    CursorColumn = { bg = palette.bg1 },
    CursorLine = { bg = palette.bg_third },
    CursorLineNr = { fg = palette.yellow_lite, bold = true },
    LineNr = { fg = palette.gray },

    -- Search
    Search = { fg = palette.bg_main, bg = palette.yellow_lite },
    CurSearch = { link = "Search" },
    IncSearch = { link = "Search" },
    Substitute = { link = "Search" },

    -- Pop-up Menu (Pmenu)
    Pmenu = { fg = palette.fg2, bg = palette.bg_second },
    PmenuSel = { fg = palette.fg, bg = palette.bg1 },
    PmenuSbar = { bg = palette.bg_second },
    PmenuThumb = { bg = palette.gray },
    PmenuExtra = { fg = palette.gray, bg = palette.bg_second },
    PmenuExtraSel = { fg = palette.fg2, bg = palette.bg1 },
    PmenuKind = { fg = palette.aqua_lite, bg = palette.bg_second },
    PmenuKindSel = { fg = palette.aqua_lite, bg = palette.bg1 },

    -- Diffs (Git)
    DiffAdd = { bg = palette.green_dark, blend = 20 },
    DiffChange = { bg = palette.yellow_dark, blend = 20 },
    DiffDelete = { bg = palette.red_dark, blend = 20 },
    DiffText = { bg = palette.blue_dark, blend = 40 },
    diffAdded = { link = "DiffAdd" },
    diffChanged = { link = "DiffChange" },
    diffRemoved = { link = "DiffDelete" },

    -- Messages & Diagnostics
    ErrorMsg = { fg = palette.red_dark, bold = true },
    WarningMsg = { fg = palette.yellow_dark, bold = true },
    ModeMsg = { fg = palette.fg2 },
    MoreMsg = { fg = palette.purple_lite },
    Question = { fg = palette.yellow_lite },
    NvimInternalError = { link = "ErrorMsg" },

    -- Visual Selection
    Visual = { bg = palette.bg2 },

    -- Other UI Elements
    Directory = { fg = palette.blue_dark, bold = true },
    Title = { fg = palette.aqua_lite, bold = true },
    FloatBorder = { fg = palette.bg2 },
    FloatTitle = { fg = palette.aqua_lite, bg = palette.bg_second, bold = true },
    FoldColumn = { fg = palette.gray },
    Folded = { fg = palette.fg2, bg = palette.bg_third },
    MatchParen = { fg = palette.purple_lite, bold = true },
    QuickFixLine = { bg = palette.bg1, bold = true },
    WildMenu = { link = "IncSearch" },

    -- Spelling
    SpellBad = { sp = palette.red_dark, undercurl = true },
    SpellCap = { sp = palette.yellow_lite, undercurl = true },
    SpellLocal = { sp = palette.blue_lite, undercurl = true },
    SpellRare = { sp = palette.purple_lite, undercurl = true },

    -- Status Line & Tab Line
    StatusLine = { fg = palette.fg1, bg = palette.bg_second },
    StatusLineNC = { fg = palette.gray, bg = palette.bg_third },
    StatusLineTerm = { fg = palette.bg_main, bg = palette.aqua_lite },
    StatusLineTermNC = { fg = palette.bg_main, bg = palette.gray },
    TabLine = { fg = palette.fg4, bg = palette.bg_second },
    TabLineFill = { bg = palette.bg_second },
    TabLineSel = { fg = palette.fg, bg = palette.bg2, bold = true },

    -- Window Bars
    WinBar = { fg = palette.fg2, bg = palette.bg_main },
    WinBarNC = { fg = palette.gray, bg = palette.bg_main },

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
    Statement = { fg = palette.red_lite, bold = true },
    StorageClass = { fg = palette.yellow_lite },
    String = { fg = palette.green_lite },
    Structure = { fg = palette.purple_lite },
    Tag = { fg = palette.yellow_lite },
    Todo = { fg = palette.yellow_lite, bg = palette.bg_second, bold = true },
    Type = { fg = palette.yellow_lite, sp = "none" },
    TypeDef = { link = "Type" },
    Underlined = { fg = palette.purple_dark, underline = true },

    -- LSP & Highlighting Groups
    LspCodeLens = { fg = palette.gray },
    LspCodeLensSeparator = { fg = palette.bg2 },
    LspInlayHint = { fg = palette.gray, bg = palette.bg1, blend = 25 },
    LspReferenceRead = { bg = palette.bg2 },
    LspReferenceText = { bg = palette.bg2 },
    LspReferenceWrite = { bg = palette.bg2 },
    LspSignatureActiveParameter = { bg = palette.bg3 },

    healthError = { fg = groups.error },
    healthSuccess = { fg = groups.info },
    healthWarning = { fg = groups.warn },

    -- HTML
    htmlArg = { fg = palette.purple_lite },
    htmlBold = { bold = true },
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

    -- Markdown
    markdownDelimiter = { fg = palette.gray },
    markdownH1 = { fg = palette.orange_lite, bold = true },
    markdownH1Delimiter = { link = "markdownH1" },
    markdownH2 = { fg = palette.yellow_lite, bold = true },
    markdownH2Delimiter = { link = "markdownH2" },
    markdownH3 = { fg = palette.green_lite, bold = true },
    markdownH3Delimiter = { link = "markdownH3" },
    markdownH4 = { fg = palette.blue_lite, bold = true },
    markdownH4Delimiter = { link = "markdownH4" },
    markdownH5 = { fg = palette.purple_lite, bold = true },
    markdownH5Delimiter = { link = "markdownH5" },
    markdownH6 = { fg = palette.aqua_lite, bold = true },
    markdownH6Delimiter = { link = "markdownH6" },
    markdownLinkText = { link = "markdownUrl" },
    markdownUrl = { fg = palette.blue_lite, underline = true },

    -- MKD (Markdown Extensions)
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

    -- Treesitter
    ["@variable"] = { fg = palette.fg1 },
    ["@variable.builtin"] = { fg = palette.orange_lite, bold = true },
    ["@variable.parameter"] = { fg = palette.red_lite },
    ["@variable.parameter.builtin"] = { fg = palette.purple_lite, italic = true, bold = true },
    ["@variable.member"] = { fg = palette.red_lite },

    ["@constant"] = { fg = palette.orange_lite },
    ["@constant.builtin"] = { fg = palette.orange_lite, bold = true },
    ["@constant.macro"] = { fg = palette.red_lite },

    ["@module"] = { fg = palette.red_lite },
    ["@module.builtin"] = { fg = palette.red_lite, bold = true },
    ["@label"] = { link = "Label" },

    ["@string.regexp"] = { fg = palette.aqua_lite },
    ["@string.escape"] = { fg = palette.aqua_dark },
    ["@string.special.url"] = { fg = palette.purple_lite },

    ["@type"] = { fg = palette.aqua_lite },
    ["@type.builtin"] = { fg = palette.aqua_lite, bold = true },

    ["@attribute"] = { fg = palette.yellow_lite },
    ["@attribute.builtin"] = { fg = palette.yellow_lite, bold = true },
    ["@property"] = { fg = palette.red_lite },

    ["@function"] = { fg = palette.purple_lite },
    ["@function.builtin"] = { fg = palette.purple_lite, bold = true },
    ["@function.method"] = { fg = palette.purple_lite },
    ["@function.method.call"] = { fg = palette.purple_lite },

    ["@constructor"] = { fg = palette.aqua_lite },

    ["@keyword"] = { fg = palette.purple_lite },
    ["@keyword.operator"] = { fg = palette.purple_lite },
    ["@keyword.function"] = { fg = palette.purple_lite },
    ["@keyword.import"] = { link = "Include" },
    ["@keyword.storage"] = { fg = palette.aqua_lite },
    ["@keyword.repeat"] = { fg = palette.green_dark },
    ["@keyword.return"] = { fg = palette.purple_lite },
    ["@keyword.debug"] = { fg = palette.red_lite },
    ["@keyword.exception"] = { fg = palette.red_dark },
    ["@keyword.conditional"] = { fg = palette.purple_lite },
    ["@keyword.conditional.ternary"] = { fg = palette.purple_lite },
    ["@keyword.directive"] = { fg = palette.yellow_lite },
    ["@keyword.directive.define"] = { fg = palette.purple_lite },

    ["@punctuation.delimiter"] = { fg = palette.gray },
    ["@punctuation.bracket"] = { fg = palette.gray },
    ["@punctuation.special"] = { fg = palette.gray },

    ["@comment.error"] = { fg = palette.red_lite },
    ["@comment.warning"] = { fg = palette.yellow_lite },
    ["@comment.todo"] = { fg = palette.purple_lite, bg = palette.bg_second, bold = true },
    ["@comment.hint"] = { fg = palette.green_lite, bg = palette.bg_second },
    ["@comment.info"] = { fg = palette.blue_lite, bg = palette.bg_second },
    ["@comment.note"] = { fg = palette.aqua_lite, bg = palette.bg_second },

    ["@markup.heading"] = { fg = palette.aqua_lite, bold = true },
    ["@markup.link.url"] = { fg = palette.blue_lite },
    ["@markup.list"] = { fg = palette.green_dark },
    ["@markup.raw.delimiter.markdown"] = { fg = palette.gray },

    ["@diff.plus"] = { fg = palette.green_lite, bg = palette.bg2 },
    ["@diff.minus"] = { fg = palette.red_lite, bg = palette.bg2 },
    ["@diff.delta"] = { bg = palette.yellow_lite, blend = 20 },

    ["@tag.attribute"] = { fg = palette.purple_lite },
    ["@tag.delimiter"] = { fg = palette.gray },
    ["@conceal.markdown"] = { fg = palette.gray },

    --- Semantic
    ["@lsp.type.comment"] = {},
    ["@lsp.type.comment.c"] = { link = "@comment" },
    ["@lsp.type.comment.cpp"] = { link = "@comment" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.interface"] = { link = "@interface" },
    ["@lsp.type.keyword"] = { link = "@keyword" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.namespace.python"] = { link = "@variable" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.variable"] = {}, -- defer to treesitter for regular variables
    ["@lsp.type.variable.svelte"] = { link = "@variable" },
    ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
    ["@lsp.typemod.operator.injected"] = { link = "@operator" },
    ["@lsp.typemod.string.injected"] = { link = "@string" },
    ["@lsp.typemod.variable.constant"] = { link = "@constant" },
    ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
    ["@lsp.typemod.variable.injected"] = { link = "@variable" },

    --- Plugins
    -- romgrk/barbar.nvim
    BufferCurrent = { fg = palette.fg, bg = palette.bg_main },
    BufferCurrentIndex = { fg = palette.blue_lite, bg = palette.bg_main },
    BufferCurrentMod = { fg = palette.aqua_lite, bg = palette.bg_main },
    BufferCurrentSign = { fg = palette.gray, bg = palette.bg_main },
    BufferCurrentTarget = { fg = palette.yellow_lite, bg = palette.bg_main },
    BufferCurrentHINT = {bg = palette.bg_main},
    BufferCurrentCHANGED = {bg = palette.bg_main},
    BufferCurrentDELETED = {bg = palette.bg_main},
    BufferCurrentERROR = {bg = palette.bg_main},
    BufferInactive = { fg = palette.gray },
    BufferInactiveIndex = { fg = palette.gray },
    BufferInactiveMod = { fg = palette.aqua_lite },
    BufferInactiveSign = { fg = palette.gray },
    BufferInactiveTarget = { fg = palette.yellow_lite },
    BufferTabpageFill = { fg = "NONE", bg = "NONE" },
    BufferVisible = { fg = palette.gray },
    BufferVisibleIndex = { fg = palette.gray },
    BufferVisibleMod = { fg = palette.aqua_lite },
    BufferVisibleSign = { fg = palette.fg4 },
    BufferVisibleTarget = { fg = palette.yellow_lite },
    BufferOffset = { fg = palette.green_lite, bg = palette.bg_main },

    -- lewis6991/gitsigns.nvim
    GitSignsAdd = { fg = groups.git_add, bg = "NONE" },
    GitSignsChange = { fg = groups.git_change, bg = "NONE" },
    GitSignsDelete = { fg = groups.git_delete, bg = "NONE" },
    SignAdd = { fg = groups.git_add, bg = "NONE" },
    SignChange = { fg = groups.git_change, bg = "NONE" },
    SignDelete = { fg = groups.git_delete, bg = "NONE" },

    -- mvllow/modes.nvim
    ModesCopy = { bg = palette.yellow_lite },
    ModesDelete = { bg = palette.red_lite },
    ModesFormat = { bg = palette.purple_lite },
    ModesInsert = { bg = palette.aqua_lite },
    ModesReplace = { bg = palette.green_dark },
    ModesVisual = { bg = palette.purple_lite },

    -- kyazdani42/nvim-tree.lua
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
    NvimTreeOpenedFile = { fg = palette.fg, bg = palette.bg3 },
    NvimTreeOpenedFolderName = { link = "NvimTreeFolderName" },
    NvimTreeRootFolder = { fg = palette.aqua_lite, bold = styles.bold },
    NvimTreeSpecialFile = { link = "NvimTreeNormal" },
    NvimTreeWindowPicker = { link = "StatusLineTerm" },

    -- nvim-neotest/neotest
    NeotestAdapterName = { fg = palette.purple_lite },
    NeotestBorder = { fg = palette.highlight_med },
    NeotestDir = { fg = palette.aqua_lite },
    NeotestExpandMarker = { fg = palette.highlight_med },
    NeotestFailed = { fg = palette.red_lite },
    NeotestFile = { fg = palette.fg },
    NeotestFocused = { fg = palette.yellow_lite, bg = palette.highlight_med },
    NeotestIndent = { fg = palette.highlight_med },
    NeotestMarked = { fg = palette.purple_lite, bold = true },
    NeotestNamespace = { fg = palette.yellow_lite },
    NeotestPassed = { fg = palette.green_dark },
    NeotestRunning = { fg = palette.yellow_lite },
    NeotestWinSelect = { fg = palette.fg4 },
    NeotestSkipped = { fg = palette.gray },
    NeotestTarget = { fg = palette.red_lite },
    NeotestTest = { fg = palette.yellow_lite },
    NeotestUnknown = { fg = palette.gray },
    NeotestWatching = { fg = palette.purple_lite },

    -- nvim-neo-tree/neo-tree.nvim
    NeoTreeGitAdded = { fg = groups.git_add },
    NeoTreeGitConflict = { fg = groups.git_merge },
    NeoTreeGitDeleted = { fg = groups.git_delete },
    NeoTreeGitIgnored = { fg = groups.git_ignore },
    NeoTreeGitModified = { fg = groups.git_dirty },
    NeoTreeGitRenamed = { fg = groups.git_rename },
    NeoTreeGitUntracked = { fg = groups.git_untracked },
    NeoTreeTabActive = { fg = palette.text, bg = palette.bg3 },
    NeoTreeTabInactive = { fg = palette.gray },
    NeoTreeTabSeparatorActive = { link = "WinSeparator" },
    NeoTreeTabSeparatorInactive = { link = "WinSeparator" },
    NeoTreeTitleBar = { link = "StatusLineTerm" },

    -- folke/flash.nvim
    FlashLabel = { fg = palette.bg_main, bg = palette.red_lite },

    -- folke/which-key.nvim
    WhichKey = { fg = palette.purple_lite },
    WhichKeyBorder = make_border(),
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

    -- lukas-reineke/indent-blankline.nvim
    IblIndent = { fg = palette.bg3 },
    IblScope = { fg = palette.aqua_lite },
    IblWhitespace = { fg = palette.bg3 },

    -- hrsh7th/nvim-cmp
    CmpItemAbbr = { fg = palette.gray },
    CmpItemAbbrDeprecated = { fg = palette.gray, strikethrough = true },
    CmpItemAbbrMatch = { fg = palette.fg, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = palette.fg, bold = true },
    CmpItemKind = { fg = palette.gray },
    CmpItemKindClass = { link = "StorageClass" },
    CmpItemKindFunction = { link = "Function" },
    CmpItemKindInterface = { link = "Type" },
    CmpItemKindMethod = { link = "PreProc" },
    CmpItemKindSnippet = { link = "String" },
    CmpItemKindVariable = { link = "Identifier" },

    -- NeogitOrg/neogit
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

    -- vimwiki/vimwiki
    VimwikiHR = { fg = palette.gray },
    VimwikiHeader1 = { link = "markdownH1" },
    VimwikiHeader2 = { link = "markdownH2" },
    VimwikiHeader3 = { link = "markdownH3" },
    VimwikiHeader4 = { link = "markdownH4" },
    VimwikiHeader5 = { link = "markdownH5" },
    VimwikiHeader6 = { link = "markdownH6" },
    VimwikiHeaderChar = { fg = palette.gray },
    VimwikiLink = { link = "markdownUrl" },
    VimwikiList = { fg = palette.purple_dark },
    VimwikiNoExistsLink = { fg = palette.red_lite },

    -- nvim-neorg/neorg
    NeorgHeading1Prefix = { link = "markdownH1Delimiter" },
    NeorgHeading1Title = { link = "markdownH1" },
    NeorgHeading2Prefix = { link = "markdownH2Delimiter" },
    NeorgHeading2Title = { link = "markdownH2" },
    NeorgHeading3Prefix = { link = "markdownH3Delimiter" },
    NeorgHeading3Title = { link = "markdownH3" },
    NeorgHeading4Prefix = { link = "markdownH4Delimiter" },
    NeorgHeading4Title = { link = "markdownH4" },
    NeorgHeading5Prefix = { link = "markdownH5Delimiter" },
    NeorgHeading5Title = { link = "markdownH5" },
    NeorgHeading6Prefix = { link = "markdownH6Delimiter" },
    NeorgHeading6Title = { link = "markdownH6" },
    NeorgMarkerTitle = { fg = palette.aqua_lite, bold = styles.bold },


    -- telescope.nvim
    TelescopeBorder = make_border(),
    TelescopeMatching = { fg = palette.purple_lite },
    TelescopeNormal = { link = "NormalFloat" },
    TelescopePromptNormal = { link = "TelescopeNormal" },
    TelescopePromptPrefix = { fg = palette.gray },
    TelescopeSelection = { fg = palette.fg, bg = palette.bg3 },
    TelescopeSelectionCaret = { fg = palette.purple_lite, bg = palette.bg3 },
    TelescopeTitle = { fg = palette.aqua_lite, bold = true },

    -- fzf-lua
    FzfLuaBorder = make_border(),
    FzfLuaBufFlagAlt = { fg = palette.gray },
    FzfLuaBufFlagCur = { fg = palette.gray },
    FzfLuaCursorLine = { fg = palette.fg, bg = palette.bg3 },
    FzfLuaFilePart = { fg = palette.fg },
    FzfLuaHeaderBind = { fg = palette.purple_lite },
    FzfLuaHeaderText = { fg = palette.red_lite },
    FzfLuaNormal = { link = "NormalFloat" },
    FzfLuaTitle = { link = "FloatTitle" },

    -- nvim-notify
    NotifyBackground = { link = "NormalFloat" },
    NotifyDEBUGBody = { link = "NormalFloat" },
    NotifyDEBUGBorder = make_border(),
    NotifyDEBUGIcon = { link = "NotifyDEBUGTitle" },
    NotifyDEBUGTitle = { fg = palette.fg4 },
    NotifyERRORBody = { link = "NormalFloat" },
    NotifyERRORBorder = make_border(groups.error),
    NotifyERRORIcon = { link = "NotifyERRORTitle" },
    NotifyERRORTitle = { fg = groups.error },
    NotifyINFOBody = { link = "NormalFloat" },
    NotifyINFOBorder = make_border(groups.info),
    NotifyINFOIcon = { link = "NotifyINFOTitle" },
    NotifyINFOTitle = { fg = groups.info },
    NotifyTRACEBody = { link = "NormalFloat" },
    NotifyTRACEBorder = make_border(palette.purple_lite),
    NotifyTRACEIcon = { link = "NotifyTRACETitle" },
    NotifyTRACETitle = { fg = palette.purple_lite },
    NotifyWARNBody = { link = "NormalFloat" },
    NotifyWARNBorder = make_border(groups.warn),
    NotifyWARNIcon = { link = "NotifyWARNTitle" },
    NotifyWARNTitle = { fg = groups.warn },

    -- rcarriga/nvim-dap-ui
    DapUIBreakpointsCurrentLine = { fg = palette.yellow_lite, bold = true },
    DapUIBreakpointsDisabledLine = { fg = palette.fg4 },
    DapUIBreakpointsInfo = { link = "DapUIThread" },
    DapUIBreakpointsLine = { link = "DapUIBreakpointsPath" },
    DapUIBreakpointsPath = { fg = palette.aqua_lite },
    DapUIDecoration = { link = "DapUIBreakpointsPath" },
    DapUIFloatBorder = make_border(),
    DapUIFrameName = { fg = palette.fg },
    DapUILineNumber = { link = "DapUIBreakpointsPath" },
    DapUIModifiedValue = { fg = palette.aqua_lite, bold = true },
    DapUIScope = { link = "DapUIBreakpointsPath" },
    DapUISource = { fg = palette.purple_lite },
    DapUIStoppedThread = { link = "DapUIBreakpointsPath" },
    DapUIThread = { fg = palette.yellow_lite },
    DapUIValue = { fg = palette.fg },
    DapUIVariable = { fg = palette.fg },
    DapUIType = { fg = palette.purple_lite },
    DapUIWatchesEmpty = { fg = palette.red_lite },
    DapUIWatchesError = { link = "DapUIWatchesEmpty" },
    DapUIWatchesValue = { link = "DapUIThread" },

    -- glepnir/dashboard-nvim
    DashboardCenter = { fg = palette.gold },
    DashboardFooter = { fg = palette.iris },
    DashboardHeader = { fg = palette.pine },
    DashboardShortcut = { fg = palette.love },

    -- glepnir/dashboard-nvim
    DashboardCenter = { fg = palette.yellow_lite },
    DashboardFooter = { fg = palette.purple_lite },
    DashboardHeader = { fg = palette.green_dark },
    DashboardShortcut = { fg = palette.red_lite },

    -- SmiteshP/nvim-navic
    NavicIconsArray = { fg = palette.yellow_lite },
    NavicIconsBoolean = { fg = palette.purple_lite },
    NavicIconsClass = { fg = palette.aqua_lite },
    NavicIconsConstant = { fg = palette.yellow_lite },
    NavicIconsConstructor = { fg = palette.yellow_lite },
    NavicIconsEnum = { fg = palette.yellow_lite },
    NavicIconsEnumMember = { fg = palette.aqua_lite },
    NavicIconsEvent = { fg = palette.yellow_lite },
    NavicIconsField = { fg = palette.aqua_lite },
    NavicIconsFile = { fg = palette.fg4 },
    NavicIconsFunction = { fg = palette.green_dark },
    NavicIconsInterface = { fg = palette.aqua_lite },
    NavicIconsKey = { fg = palette.purple_lite },
    NavicIconsKeyword = { fg = palette.green_dark },
    NavicIconsMethod = { fg = palette.purple_lite },
    NavicIconsModule = { fg = palette.purple_lite },
    NavicIconsNamespace = { fg = palette.fg4 },
    NavicIconsNull = { fg = palette.red_lite },
    NavicIconsNumber = { fg = palette.yellow_lite },
    NavicIconsObject = { fg = palette.yellow_lite },
    NavicIconsOperator = { fg = palette.gray },
    NavicIconsPackage = { fg = palette.fg4 },
    NavicIconsProperty = { fg = palette.aqua_lite },
    NavicIconsString = { fg = palette.yellow_lite },
    NavicIconsStruct = { fg = palette.aqua_lite },
    NavicIconsTypeParameter = { fg = palette.aqua_lite },
    NavicIconsVariable = { fg = palette.fg },
    NavicSeparator = { fg = palette.gray },
    NavicText = { fg = palette.gray },

    -- folke/noice.nvim
    NoiceCursor = { fg = palette.highlight_high, bg = palette.fg },

    -- folke/trouble.nvim
    TroubleText = { fg = palette.gray },
    TroubleCount = { fg = palette.purple_lite, bg = palette.bg_second },
    TroubleNormal = { fg = palette.fg, bg = groups.panel },

    -- echasnovski/mini.nvim
    MiniAnimateCursor = { reverse = true, nocombine = true },
    MiniAnimateNormalFloat = { link = "NormalFloat" },

    MiniClueBorder = { link = "FloatBorder" },
    MiniClueDescGroup = { link = "DiagnosticFloatingWarn" },
    MiniClueDescSingle = { link = "NormalFloat" },
    MiniClueNextKey = { link = "DiagnosticFloatingHint" },
    MiniClueNextKeyWithPostkeys = { link = "DiagnosticFloatingError" },
    MiniClueSeparator = { link = "DiagnosticFloatingInfo" },
    MiniClueTitle = { bg = groups.panel, bold = true },

    MiniCompletionActiveParameter = { underline = true },

    MiniCursorword = { underline = true },
    MiniCursorwordCurrent = { underline = true },

    MiniDepsChangeAdded = { fg = groups.git_add },
    MiniDepsChangeRemoved = { fg = groups.git_delete },
    MiniDepsHint = { link = "DiagnosticHint" },
    MiniDepsInfo = { link = "DiagnosticInfo" },
    MiniDepsMsgBreaking = { link = "DiagnosticWarn" },
    MiniDepsPlaceholder = { link = "Comment" },
    MiniDepsTitle = { link = "Title" },
    MiniDepsTitleError = { link = "DiffDelete" },
    MiniDepsTitleSame = { link = "DiffText" },
    MiniDepsTitleUpdate = { link = "DiffAdd" },

    MiniDiffOverAdd = { fg = groups.git_add, bg = groups.git_add, blend = 20 },
    MiniDiffOverChange = { fg = groups.git_change, bg = groups.git_change, blend = 20 },
    MiniDiffOverContext = { bg = palette.bg_second },
    MiniDiffOverDelete = { fg = groups.git_delete, bg = groups.git_delete, blend = 20 },
    MiniDiffSignAdd = { fg = groups.git_add },
    MiniDiffSignChange = { fg = groups.git_change },
    MiniDiffSignDelete = { fg = groups.git_delete },

    MiniFilesBorder = { link = "FloatBorder" },
    MiniFilesBorderModified = { link = "DiagnosticFloatingWarn" },
    MiniFilesCursorLine = { link = "CursorLine" },
    MiniFilesDirectory = { link = "Directory" },
    MiniFilesFile = { fg = palette.fg },
    MiniFilesNormal = { link = "NormalFloat" },
    MiniFilesTitle = { link = "FloatTitle" },
    MiniFilesTitleFocused = { fg = palette.purple_lite, bg = groups.panel, bold = true },

    MiniHipatternsFixme = { fg = palette.bg_main, bg = groups.error, bold = true },
    MiniHipatternsHack = { fg = palette.bg_main, bg = groups.warn, bold = true },
    MiniHipatternsNote = { fg = palette.bg_main, bg = groups.info, bold = true },
    MiniHipatternsTodo = { fg = palette.bg_main, bg = groups.hint, bold = true },

    MiniIconsAzure = { fg = palette.aqua_lite },
    MiniIconsBlue = { fg = palette.green_dark },
    MiniIconsCyan = { fg = palette.aqua_lite },
    MiniIconsGreen = { fg = palette.green_lite },
    MiniIconsGrey = { fg = palette.gray },
    MiniIconsOrange = { fg = palette.purple_lite },
    MiniIconsPurple = { fg = palette.purple_lite },
    MiniIconsRed = { fg = palette.red_lite },
    MiniIconsYellow = { fg = palette.yellow_lite },

    MiniIndentscopeSymbol = { fg = palette.fg4 },
    MiniIndentscopeSymbolOff = { fg = palette.yellow_lite },

    MiniJump = { sp = palette.yellow_lite, undercurl = true },

    MiniJump2dDim = { fg = palette.gray },
    MiniJump2dSpot = { fg = palette.yellow_lite, bold = true, nocombine = true },
    MiniJump2dSpotAhead = { fg = palette.aqua_lite, bg = palette.bg_second, nocombine = true },
    MiniJump2dSpotUnique = { fg = palette.purple_lite, bold = true, nocombine = true },

    MiniMapNormal = { link = "NormalFloat" },
    MiniMapSymbolCount = { link = "Special" },
    MiniMapSymbolLine = { link = "Title" },
    MiniMapSymbolView = { link = "Delimiter" },

    MiniNotifyBorder = { link = "FloatBorder" },
    MiniNotifyNormal = { link = "NormalFloat" },
    MiniNotifyTitle = { link = "FloatTitle" },

    MiniOperatorsExchangeFrom = { link = "IncSearch" },

    MiniPickBorder = { link = "FloatBorder" },
    MiniPickBorderBusy = { link = "DiagnosticFloatingWarn" },
    MiniPickBorderText = { bg = groups.panel },
    MiniPickIconDirectory = { link = "Directory" },
    MiniPickIconFile = { link = "MiniPickNormal" },
    MiniPickHeader = { link = "DiagnosticFloatingHint" },
    MiniPickMatchCurrent = { link = "CursorLine" },
    MiniPickMatchMarked = { link = "Visual" },
    MiniPickMatchRanges = { fg = palette.aqua_lite },
    MiniPickNormal = { link = "NormalFloat" },
    MiniPickPreviewLine = { link = "CursorLine" },
    MiniPickPreviewRegion = { link = "IncSearch" },
    MiniPickPrompt = { bg = groups.panel, bold = true },

    MiniStarterCurrent = { nocombine = true },
    MiniStarterFooter = { fg = palette.gray },
    MiniStarterHeader = { link = "Title" },
    MiniStarterInactive = { link = "Comment" },
    MiniStarterItem = { link = "Normal" },
    MiniStarterItemBullet = { link = "Delimiter" },
    MiniStarterItemPrefix = { link = "WarningMsg" },
    MiniStarterSection = { fg = palette.purple_lite },
    MiniStarterQuery = { link = "MoreMsg" },

    MiniStatuslineDevinfo = { fg = palette.gray, bg = palette.bg3 },
    MiniStatuslineFileinfo = { link = "MiniStatuslineDevinfo" },
    MiniStatuslineFilename = { fg = palette.fg4, bg = palette.bg_second },
    MiniStatuslineInactive = { link = "MiniStatuslineFilename" },
    MiniStatuslineModeCommand = { fg = palette.bg_main, bg = palette.red_lite, bold = true },
    MiniStatuslineModeInsert = { fg = palette.bg_main, bg = palette.aqua_lite, bold = true },
    MiniStatuslineModeNormal = { fg = palette.bg_main, bg = palette.purple_lite, bold = true },
    MiniStatuslineModeOther = { fg = palette.bg_main, bg = palette.purple_lite, bold = true },
    MiniStatuslineModeReplace = { fg = palette.bg_main, bg = palette.green_dark, bold = true },
    MiniStatuslineModeVisual = { fg = palette.bg_main, bg = palette.purple_lite, bold = true },

    MiniSurround = { link = "IncSearch" },

    MiniTablineCurrent = { fg = palette.fg, bg = palette.bg3, bold = true },
    MiniTablineFill = { link = "TabLineFill" },
    MiniTablineHidden = { fg = palette.gray, bg = groups.panel },
    MiniTablineModifiedCurrent = { fg = palette.bg3, bg = palette.fg, bold = true },
    MiniTablineModifiedHidden = { fg = groups.panel, bg = palette.gray },
    MiniTablineModifiedVisible = { fg = groups.panel, bg = palette.fg },
    MiniTablineTabpagesection = { link = "Search" },
    MiniTablineVisible = { fg = palette.fg, bg = groups.panel },

    MiniTestEmphasis = { bold = true },
    MiniTestFail = { fg = palette.red_lite, bold = true },
    MiniTestPass = { fg = palette.aqua_lite, bold = true },

    MiniTrailspace = { bg = palette.red_lite },

    -- goolord/alpha-nvim
    AlphaButtons = { fg = palette.aqua_lite },
    AlphaFooter = { fg = palette.yellow_lite },
    AlphaHeader = { fg = palette.green_dark },
    AlphaShortcut = { fg = palette.purple_lite },

    -- nvim-treesitter/nvim-treesitter-context
    TreesitterContext = { bg = palette.bg3 },
    TreesitterContextLineNumber = { fg = palette.purple_lite, bg = palette.bg3 },

    -- RRethy/vim-illuminate
    IlluminatedWordRead = { link = "LspReferenceRead" },
    IlluminatedWordText = { link = "LspReferenceText" },
    IlluminatedWordWrite = { link = "LspReferenceWrite" },

    -- HiPhish/rainbow-delimiters.nvim
    RainbowDelimiterBlue = { fg = palette.green_dark },
    RainbowDelimiterCyan = { fg = palette.aqua_lite },
    RainbowDelimiterGreen = { fg = palette.green_lite },
    RainbowDelimiterOrange = { fg = palette.purple_lite },
    RainbowDelimiterRed = { fg = palette.red_lite },
    RainbowDelimiterViolet = { fg = palette.purple_lite },
    RainbowDelimiterYellow = { fg = palette.yellow_lite },

    -- MeanderingProgrammer/render-markdown.nvim
    RenderMarkdownBullet = { fg = palette.purple_lite },
    RenderMarkdownChecked = { fg = palette.aqua_lite },
    RenderMarkdownCode = { bg = palette.bg3 },
    RenderMarkdownCodeInline = { fg = palette.fg, bg = palette.bg3 },
    RenderMarkdownDash = { fg = palette.fg4 },
    RenderMarkdownH1Bg = { bg = groups.h1, blend = 20 },
    RenderMarkdownH2Bg = { bg = groups.h2, blend = 20 },
    RenderMarkdownH3Bg = { bg = groups.h3, blend = 20 },
    RenderMarkdownH4Bg = { bg = groups.h4, blend = 20 },
    RenderMarkdownH5Bg = { bg = groups.h5, blend = 20 },
    RenderMarkdownH6Bg = { bg = groups.h6, blend = 20 },
    RenderMarkdownQuote = { fg = palette.gray },
    RenderMarkdownTableFill = { link = "Conceal" },
    RenderMarkdownTableHead = { fg = palette.gray },
    RenderMarkdownTableRow = { fg = palette.gray },
    RenderMarkdownUnchecked = { fg = palette.gray },

    -- MagicDuck/grug-far.nvim
    GrugFarHelpHeader = { fg = palette.green_dark },
    GrugFarHelpHeaderKey = { fg = palette.yellow_lite },
    GrugFarHelpWinActionKey = { fg = palette.yellow_lite },
    GrugFarHelpWinActionPrefix = { fg = palette.aqua_lite },
    GrugFarHelpWinActionText = { fg = palette.green_dark },
    GrugFarHelpWinHeader = { link = "FloatTitle" },
    GrugFarInputLabel = { fg = palette.aqua_lite },
    GrugFarInputPlaceholder = { link = "Comment" },
    GrugFarResultsActionMessage = { fg = palette.aqua_lite },
    GrugFarResultsChangeIndicator = { fg = groups.git_change },
    GrugFarResultsRemoveIndicator = { fg = groups.git_delete },
    GrugFarResultsAddIndicator = { fg = groups.git_add },
    GrugFarResultsHeader = { fg = palette.green_dark },
    GrugFarResultsLineNo = { fg = palette.purple_lite },
    GrugFarResultsLineColumn = { link = "GrugFarResultsLineNo" },
    GrugFarResultsMatch = { link = "CurSearch" },
    GrugFarResultsPath = { fg = palette.aqua_lite },
    GrugFarResultsStats = { fg = palette.purple_lite },

    -- yetone/avante.nvim
    AvanteTitle = { fg = palette.highlight_high, bg = palette.purple_lite },
    AvanteReversedTitle = { fg = palette.purple_lite },
    AvanteSubtitle = { fg = palette.highlight_med, bg = palette.aqua_lite },
    AvanteReversedSubtitle = { fg = palette.aqua_lite },
    AvanteThirdTitle = { fg = palette.highlight_med, bg = palette.purple_lite },
    AvanteReversedThirdTitle = { fg = palette.purple_lite },

    -- Saghen/blink.cmp
    BlinkCmpDoc = { bg = palette.highlight_low },
    BlinkCmpDocSeparator = { bg = palette.highlight_low },
    BlinkCmpDocBorder = { fg = palette.highlight_high },
    BlinkCmpGhostText = { fg = palette.fg4 },

    BlinkCmpLabel = { fg = palette.fg4 },
    BlinkCmpLabelDeprecated = { fg = palette.fg4, strikethrough = true },
    BlinkCmpLabelMatch = { fg = palette.fg, bold = true },

    BlinkCmpDefault = { fg = palette.highlight_med },
    BlinkCmpKindText = { fg = palette.green_dark },
    BlinkCmpKindMethod = { fg = palette.aqua_lite },
    BlinkCmpKindFunction = { fg = palette.aqua_lite },
    BlinkCmpKindConstructor = { fg = palette.aqua_lite },
    BlinkCmpKindField = { fg = palette.green_dark },
    BlinkCmpKindVariable = { fg = palette.purple_lite },
    BlinkCmpKindClass = { fg = palette.yellow_lite },
    BlinkCmpKindInterface = { fg = palette.yellow_lite },
    BlinkCmpKindModule = { fg = palette.aqua_lite },
    BlinkCmpKindProperty = { fg = palette.aqua_lite },
    BlinkCmpKindUnit = { fg = palette.green_dark },
    BlinkCmpKindValue = { fg = palette.red_lite },
    BlinkCmpKindKeyword = { fg = palette.purple_lite },
    BlinkCmpKindSnippet = { fg = palette.purple_lite },
    BlinkCmpKindColor = { fg = palette.red_lite },
    BlinkCmpKindFile = { fg = palette.aqua_lite },
    BlinkCmpKindReference = { fg = palette.red_lite },
    BlinkCmpKindFolder = { fg = palette.aqua_lite },
    BlinkCmpKindEnum = { fg = palette.aqua_lite },
    BlinkCmpKindEnumMember = { fg = palette.aqua_lite },
    BlinkCmpKindConstant = { fg = palette.yellow_lite },
    BlinkCmpKindStruct = { fg = palette.aqua_lite },
    BlinkCmpKindEvent = { fg = palette.aqua_lite },
    BlinkCmpKindOperator = { fg = palette.aqua_lite },
    BlinkCmpKindTypeParameter = { fg = palette.purple_lite },
    BlinkCmpKindCodeium = { fg = palette.aqua_lite },
    BlinkCmpKindCopilot = { fg = palette.aqua_lite },
    BlinkCmpKindSupermaven = { fg = palette.aqua_lite },
    BlinkCmpKindTabNine = { fg = palette.aqua_lite },

    -- folke/snacks.nvim
    SnacksIndent = { fg = palette.bg3 },
    SnacksIndentChunk = { fg = palette.bg3 },
    SnacksIndentBlank = { fg = palette.bg3 },
    SnacksIndentScope = { fg = palette.aqua_lite },

    SnacksPickerMatch = { fg = palette.purple_lite, bold = true },

    -- justinmk/vim-sneak
    Sneak = { fg = palette.bg_main, bg = palette.red_lite },
    SneakCurrent = { link = "StatusLineTerm" },
    SneakScope = { link = "IncSearch" },
  }
  local transparency_highlights = {
    DiagnosticVirtualTextError = { fg = groups.error },
    DiagnosticVirtualTextHint = { fg = groups.hint },
    DiagnosticVirtualTextInfo = { fg = groups.info },
    DiagnosticVirtualTextOk = { fg = groups.ok },
    DiagnosticVirtualTextWarn = { fg = groups.warn },

    FloatBorder = { fg = palette.fg4, bg = "NONE" },
    FloatTitle = { fg = palette.aqua_lite, bg = "NONE", bold = true },
    Folded = { fg = palette.fg, bg = "NONE" },
    NormalFloat = { bg = "NONE" },
    Normal = { fg = palette.fg, bg = "NONE" },
    NormalNC = { fg = palette.fg, bg = config.options.dim_inactive_windows and palette._nc or "NONE" },
    Pmenu = { fg = palette.gray, bg = "NONE" },
    PmenuKind = { fg = palette.aqua_lite, bg = "NONE" },
    SignColumn = { fg = palette.fg, bg = "NONE" },
    StatusLine = { fg = palette.gray, bg = "NONE" },
    StatusLineNC = { fg = palette.fg4, bg = "NONE" },
    TabLine = { bg = "NONE", fg = palette.gray },
    TabLineFill = { bg = "NONE" },
    TabLineSel = { fg = palette.fg, bg = "NONE", bold = true },

    ["@markup.raw.markdown_inline"] = { fg = palette.yellow_lite },

    TelescopeNormal = { fg = palette.gray, bg = "NONE" },
    TelescopePromptNormal = { fg = palette.fg, bg = "NONE" },
    TelescopeSelection = { fg = palette.fg, bg = "NONE", bold = true },
    TelescopeSelectionCaret = { fg = palette.purple_lite },

    TroubleNormal = { bg = "NONE" },

    WhichKeyFloat = { bg = "NONE" },
    WhichKeyNormal = { bg = "NONE" },

    IblIndent = { fg = palette.bg3, bg = "NONE" },
    IblScope = { fg = palette.aqua_lite, bg = "NONE" },
    IblWhitespace = { fg = palette.bg3, bg = "NONE" },

    TreesitterContext = { bg = "NONE" },
    TreesitterContextLineNumber = { fg = palette.purple_lite, bg = "NONE" },

    MiniFilesTitleFocused = { fg = palette.purple_lite, bg = "NONE", bold = true },

    MiniPickPrompt = { bg = "NONE", bold = true },
    MiniPickBorderText = { bg = "NONE" },
  }

  if config.options.enable.legacy_highlights then
    for group, highlight in pairs(legacy_highlights) do
      highlights[group] = highlight
    end
  end
  for group, highlight in pairs(default_highlights) do
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
