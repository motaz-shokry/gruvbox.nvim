# Lua version of [gruvbox](https://github.com/morhetz/gruvbox) theme, but the hard variant background is "#1b1b1b" not "#1d2021" 🙃.

## Why!
As a fan of the graphicbox theme, I tried [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) for the nvim editor, but it was bad in appearance and layout, and the worst thing was that the hard background was "#1d2021" not "#1b1b1b". So I decided to modify it and add some improvements to it, but the code structure didn't allow for much, so I decided to make this theme inspired by the code structure of the wonderful [rose pine](https://github.com/rose-pine/neovim) theme, and this is it. I hope you like it.

## Getting started

Install `motaz_shokry/gruvbox.nvim` using [Lazy](https://github.com/folke/lazy.nvim) package manager:

```lua
-- lua/plugins/gruvbox.lua
return {
	"https://gitlab.com/motaz-shokry/gruvbox.nvim",
	name = "gruvbox",
	config = function()
		vim.cmd("colorscheme gruvbox")
	end
}
```

## Screen Shots

**Gruvbox Hard Variant**

![Gruvbox Hard Variant]()

**Gruvbox Medium Variant**

![Gruvbox Medium Variant]()

**Gruvbox Soft Variant**

![Gruvbox Soft Variant]()

**Gruvbox Light Variant**

![Gruvbox Light Variant]()

## Options

> [!IMPORTANT]
> Configure options _before_ setting colorscheme.

Gruvbox has four variants: hard, medium, soft and light. By default, `vim.o.background` is followed, using light when light and `dark_variant` when dark.

```lua
require("gruvbox").setup({
  variant = "hard",        -- hard, medium, soft, light
  dark_variant = "medium", -- hard, medium, soft
  dim_inactive_windows = false,
  extend_background_behind_borders = false,

  enable = {
  terminal = true,
  legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
  migrations = true,        -- Handle deprecated options automatically
  },

  styles = {
  bold = true,
  italic = true,
  transparency = false,
  },

  groups = {
  -- UI Elements
  border = "gray",
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

  palette = {
      -- Override the builtin palette per variant
          -- hard = {
              --     bg_main = "#1D2021",
              --     fg = "#D4C5A0",
              -- },
  },

  -- NOTE: Highlight groups are extended (merged) by default. Disable this
      -- per group via `inherit = false`
      highlight_groups = {
          -- Comment = { fg = "gray" },
          -- StatusLine = { fg = "bg1", bg = "bg1", blend = 15 },
          -- VertSplit = { fg = "bg4", bg = "bg4" },
          -- Visual = { fg = "bg_second", bg = "fg1", inherit = false },
      },

  before_highlight = function(group, highlight, palette)
      -- Disable all undercurls
      -- if highlight.undercurl then
      --     highlight.undercurl = false
      -- end
      --
      -- Change palette colour
      -- if highlight.fg == palette.blue_lite then
      --     highlight.fg = palette.purple_lite
      -- end
      end,
})

vim.cmd("colorscheme gruvbox")
-- vim.cmd("colorscheme gruvbox-hard")
-- vim.cmd("colorscheme gruvbox-medium")
-- vim.cmd("colorscheme gruvobx-soft")
-- vim.cmd("colorscheme gruvobx-light")
```

## Contributing

We welcome and appreciate contributions of any kind. Create an issue or start a discussion for any proposed changes. Pull requests are encouraged for supporting additional plugins or [treesitter improvements](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/CONTRIBUTING.md#highlights).

Feel free to update the [README](https://gitlab.com/motaz-shokry/gruvbox.nvim/README) with any improvements.
Project inspired by the file and code structure of [rose pine](https://github.com/rose-pine/neovim) nvim theme.
