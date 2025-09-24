return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false, -- Load immediately on startup
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  opts = {
    workspaces = {
      {
        name = "nerdbrain",
        path = vim.fn.expand("~/Documents/obsidian/nerdbrain"),
      },
      {
        name = "tutoria",
        path = vim.fn.expand("~/Documents/obsidian/secondbrain-tutorial"),
      },
    },

    -- Pozwól na używanie komend poza vault
    detect_cwd = false,

    -- Opcje otwierania notatek
    open_notes_in = "current",
    -- UI picker configuration
    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      -- Użyj telescope jako picker
      checkboxes = {
        [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        ["x"] = { char = "✔", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianImportant = { bold = true, fg = "#d73128" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },

    -- Picker configuration
    picker = {
      name = "telescope.nvim",
      mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
    },

    completion = {
      nvim_cmp = false, -- wyłączamy bo używamy blink.cmp
      min_chars = 2, -- number of characters required to show suggestions
      new_notes_location = "0. Inbox",
    },
    -- Używamy domyślnych mapowań pluginu
    mappings = {},

    -- see below for full list of options 👇
  },
}
