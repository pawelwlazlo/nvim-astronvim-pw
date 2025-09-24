-- Upewnij się że blink.cmp ma włączone źródła obsidian
return {
  "Saghen/blink.cmp",
  dependencies = { "giuxtaposition/blink.compat" },
  opts = function(_, opts)
    -- Upewnij się że sources są skonfigurowane
    opts.sources = opts.sources or {}
    opts.sources.default = opts.sources.default or { "lsp", "path", "snippets", "buffer" }

    -- Dodaj źródła obsidian jeśli jesteśmy w markdown z vault
    opts.sources.providers = opts.sources.providers or {}

    -- Włącz compat mode dla obsidian
    opts.sources.compat = opts.sources.compat or {}
    table.insert(opts.sources.compat, "obsidian")
    table.insert(opts.sources.compat, "obsidian_new")
    table.insert(opts.sources.compat, "obsidian_tags")

    -- Ustaw trigger characters
    opts.sources.trigger = opts.sources.trigger or {}
    opts.sources.trigger.completion = opts.sources.trigger.completion or {}
    opts.sources.trigger.completion.keyword_regex = "[%w_\\-#\\[\\]]"

    return opts
  end,
}