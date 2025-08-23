return {
  "Exafunction/codeium.nvim",
  event = "InsertEnter",
  config = function()
    require("codeium").setup({
      virtual_text = {
        enabled = true,
        key_bindings = {
          accept = "<Tab>",
          accept_word = "<C-Right>",
          accept_line = "<C-l>", 
          next = "<C-M-]>",
          prev = "<C-M-[>",
          dismiss = "<C-]>",
        }
      },
    })
  end,
}