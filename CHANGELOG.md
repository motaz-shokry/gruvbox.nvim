# Changelog
## [2.0.0] - 2026-01-15

###  **Architectural Overhaul**
Version 2.0 represents a complete restructuring of the theme's architecture, transitioning from a monolithic design to a modular, integration-based system. This change significantly improves maintainability, extensibility, and separation of concerns.

###  **Added**
- **Modular Integrations System**: New `/lua/gruvbox/integrations/` directory containing dedicated modules for plugin support
- **Dynamic Integration Loader**: Automatic detection and loading of enabled integrations during theme initialization
- **Comprehensive Devicons Support**: Complete nvim-web-devicons color mappings.
- **Automatic Lualine Integration**: Built-in theme generation and configuration for lualine.nvim
- **Plugin Configuration Control**: Granular enable/disable controls for some integration via `config.options.enable`

###  **Changed**
- **Core Structure**: Moved from monolithic `gruvbox.lua` to modular architecture
- **File Organization**:

```
gruvbox.nvim/lua/
├── gruvbox/
│ ├── integrations/ # New: Plugin-specific modules
│ ├── config.lua # User configuration
│ ├── palette.lua # Color definitions
│ └── utilities.lua # Helper functions
└── gruvbox.lua # Streamlined entry point
```

- **Integration Loading**: Plugin highlights are now loaded dynamically rather than hardcoded
- **Lualine Theme Location**: Moved from `/lua/lualine/themes/` to the integrations system

###  **Breaking Changes**
- **Plugin Highlight Definitions**: Custom highlight overrides for plugins (GitSigns, LSP, Treesitter, etc.) may need adjustment to work with the new integration system
- **Configuration Paths**: Direct references to internal highlight structures may need updating
- **Lualine Theme Access**: The lualine theme is now managed through the integration system

###  **Migration Guide**

#### For Most Users
No action required! Your existing configuration will continue to work. The new features will be available automatically.

#### For Advanced Users with Custom Highlights
If you've customized plugin-specific highlights, you may need to:

1. **Review the new structure**: Check the corresponding integration file in `/lua/gruvbox/integrations/`
2. **Update your configuration**: Use the new `config.options.highlight_groups` to override integration defaults
3. **For lualine users**: The theme is now applied automatically. Remove any manual `require('lualine').setup()` calls that set the theme
