-- Disable blink.cmp Tab to let Codeium handle it
return {
  "Saghen/blink.cmp",
  optional = true,
  opts = function(_, opts)
    if not opts.keymap then opts.keymap = {} end
    
    -- Remove Tab from blink.cmp to avoid conflicts
    opts.keymap["<Tab>"] = nil
    opts.keymap["<S-Tab>"] = nil
    
    return opts
  end,
}
