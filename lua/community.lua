-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.php" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.spring-boot" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.utility.hover-nvim" },
  { import = "astrocommunity.scrolling.mini-animate" },
  -- import/override with your plugins folder
}
