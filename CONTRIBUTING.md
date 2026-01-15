# Contributing

## Introduction

Gruvbox.nvim is a Neovim colorscheme based on the classic Gruvbox color palette. The project is built in a modular way where plugin support can be easily added through the integrations system.

## How to Contribute

1. **Fork** the repository
2. **Create a new branch**: `git checkout -b feature/new-plugin-support`
3. **Make your changes** and commit them
4. **Create a Pull Request** 

## Adding Support for a Plugin

To add support for a new plugin, follow these steps:
### 1. Understand the Plugin Structure

Before starting, make sure to:
- Know the highlight group names used by the plugin
- Understand appropriate color mappings for each group
- Review the plugin's documentation

### 2. Create a New Integration File

Create a new file in `lua/gruvbox/integrations/` named after the plugin:
```lua
-- lua/gruvbox/integrations/[plugin-name].lua
local M = {}

--- Setup highlights for the plugin
--- @param palette table Color palette
--- @param config table Theme configuration
--- @param utilities table Utility functions
--- @param groups table Predefined groups
--- @return table highlights
function M.setup(palette, config, utilities, groups)
  local highlights = {}
  
  -- Example: Adding highlights for Telescope
  highlights["TelescopeNormal"] = { bg = palette.bg_main }
  highlights["TelescopeBorder"] = { fg = groups.border, bg = palette.bg_main }
  highlights["TelescopePromptNormal"] = { bg = palette.bg_second }
  
  return highlights
end

return M
```

### 3. Update the Integrations List

Add the new integration name to the `integrations` array in `lua/gruvbox.lua`:

```lua
local integrations = {
  "gitsigns",
  "lsp",
  "treesitter",
  "devicons",
  "telescope", -- Add this line
}
```

## Creating a New Integration
### Integration File Structure

Each integration file should contain:
1. **Main `setup` function** that returns a table of highlights
3. **Correct usage of palette and groups**

### Complete Example: Adding Telescope Support

```
lua

-- lua/gruvbox/integrations/telescope.lua
local M = {}

--- Setup highlights for Telescope
--- @param palette table Color palette
--- @param config table Theme configuration
--- @param utilities table Utility functions
--- @param groups table Predefined groups
--- @return table highlights
function M.setup(palette, config, utilities, groups)
  local styles = config.options.styles
  
  return {
    TelescopeBorder = utilities.make_border(groups.border, config, palette, styles),
    TelescopeMatching = { fg = palette.purple_lite },
    TelescopeNormal = { link = "NormalFloat" },
    TelescopePromptNormal = { link = "TelescopeNormal" },
    TelescopePromptPrefix = { fg = palette.gray },
    TelescopeSelection = { fg = palette.fg, bg = palette.bg3 },
    TelescopeSelectionCaret = { fg = palette.purple_lite, bg = palette.bg3 },
    TelescopeTitle = { fg = palette.aqua_lite, bold = styles.bold },
  }
end

return M
```
### Available Group Types
You can use:
1. **Direct palette colors**: `palette.red_dark`, `palette.bg_main`
2. **Predefined groups**: `groups.error`, `groups.git_add`
3. **Styles**: `styles.bold`, `styles.italic`

## Testing Changes

``` lua
-- In Neovim, test your changes
:luafile lua/gruvbox/integrations/new-plugin.lua
:colorscheme gruvbox
:hi TelescopeNormal  -- Verify the highlight is set
```
### 3. Compatibility Checklist

Ensure:
- Works with all variants (hard, medium, soft, light)
- Doesn't conflict with existing highlights
- Supports `transparency` option if applicable
- Handles `dim_inactive_windows` correctly

## Commit Guidelines

### 1. Commit Messages

Use Conventional Commits format:

``` text
feat(integrations): add support for telescope plugin
^    ^            ^
|    |            |__ Summary
|    |______________ Scope
|___________________ Type
```


Thanks (:
