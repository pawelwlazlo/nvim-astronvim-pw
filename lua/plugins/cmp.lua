return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-cmdline", ft = { "vim", "lua" } },
  },
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    opts.sources = opts.sources or {}
    table.insert(opts.sources, 1, {
      name = "codeium",
      group_index = 1,
      priority = 100,
    })
  end,
}