local configs = require("lspconfig.configs")
local lspconfig = require("lspconfig")

-- 1. Create a custom configuration for Elvish if it isn't pre-defined
if not configs.elvish then
  configs.elvish = {
    default_config = {
      cmd = { "elvish", "--lsp" }, -- Tells Neovim to call the shell's built-in LSP mode
      filetypes = { "elvish" },
      root_dir = lspconfig.util.root_pattern("*.elv", ".git"),
      settings = {},
    },
  }
end
