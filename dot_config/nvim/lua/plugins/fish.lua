return {
  -- Configure nvim-lspconfig to recognize fish-lsp
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Tell LazyVim to start fish-lsp for fish files
        fish_lsp = {
          filetypes = { "fish", "fish.gotmpl" },
        },
      },
    },
  },

  -- Ensure Tree-Sitter highlighting is installed for Fish
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, "fish")
      end
    end,
  },

  -- Configure automatic formatting via conform.nvim
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        fish = { "fish_indent" },
      },
    },
  },
}
