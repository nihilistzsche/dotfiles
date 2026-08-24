return {
  "wincent/ferret",
  -- Load the plugin when you use any of its commands or keymaps
  cmd = { "Ack", "Lack", "Back", "Black", "Quack" },
  keys = {
    { "<leader>a", desc = "Ferret Search (Ack)" },
    { "<leader>s", desc = "Ferret Search Word under Cursor" },
  },
  config = function()
    -- Optional: Ferret automatically favors ripgrep if installed,
    -- but you can explicitly configure global variables here if needed.
    -- vim.g.FerretExecutable = 'rg'
  end,
}
