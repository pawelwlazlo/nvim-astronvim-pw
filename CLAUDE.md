# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Configuration Architecture

This is an AstroNvim v5+ configuration built on the Lazy.nvim plugin manager. The configuration follows AstroNvim's modular structure:

- `init.lua` - Bootstraps Lazy.nvim and loads core modules
- `lua/lazy_setup.lua` - Main Lazy.nvim configuration with AstroNvim imports
- `lua/community.lua` - AstroCommunity pack imports for language support
- `lua/plugins/` - Custom plugin configurations that extend/override AstroNvim defaults
- `lua/polish.lua` - Final configuration tweaks (currently disabled)

## Key Configuration Files

### Core AstroNvim Plugins
- `lua/plugins/astrocore.lua` - Core features, mappings, and vim options
- `lua/plugins/astrolsp.lua` - LSP configuration and formatting settings
- `lua/plugins/astroui.lua` - UI customizations

### Custom Plugins
- `lua/plugins/codeium.lua` - Codeium AI completion integration
- `lua/plugins/cmp_ai.lua` - Tab completion integration between Codeium and blink.cmp
- `lua/plugins/dap.lua` - Debug Adapter Protocol setup for Go and Node.js
- `lua/plugins/mason.lua` - Tool installer configuration

## Language Support

Configured language packs via AstroCommunity:
- Lua, Go, PHP, Java, Spring Boot, Kotlin
- TypeScript (all-in-one pack), JavaScript
- TailwindCSS, Docker, YAML, JSON
- Hyprlang (Hyprland config)

## AI/Completion Setup

The configuration integrates Codeium AI completion with custom Tab key bindings that prioritize:
1. Codeium suggestions (when available)
2. Snippet expansion/navigation
3. Regular completion acceptance

## Debug Configuration

DAP is configured for:
- **Node.js/TypeScript**: Uses node-debug2-adapter via Mason
- **Go**: Uses Delve debugger with server configuration

Debug adapters are auto-installed via mason-nvim-dap.

## Development Commands

Since this is a Neovim configuration:
- Test changes by restarting Neovim: `nvim`
- Check plugin status: `:Lazy` 
- Install/update plugins: `:Lazy sync`
- Check LSP status: `:LspInfo`
- Install language servers: `:Mason`

## File Modification Guidelines

When modifying configuration files:
- Plugin configurations in `lua/plugins/` override AstroNvim defaults
- Use AstroNvim's structured approach (opts tables, lazy loading)
- Language packs should be added to `lua/community.lua`
- Core settings go in `astrocore.lua`, LSP settings in `astrolsp.lua`
- The configuration uses Polish comments/documentation - maintain this convention

## Important Notes

- `lua/polish.lua` is currently disabled (line 1: `if true then return end`)
- Mason auto-installs: lua-language-server, stylua, debugpy, tree-sitter-cli
- Format on save is enabled globally with 1000ms timeout
- Relative line numbers and sign column are enabled