-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("config.lspconfig")
require("config.neo-tree")
require("config.indent-blankline")

if vim.g.neovide then
  require("config.neovide")
end
