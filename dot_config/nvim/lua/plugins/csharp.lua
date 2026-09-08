return {
  -- Core LSP Configuration
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Disable the default standard omnisharp if it tries to load
        omnisharp = { enabled = false },

        -- Enable and configure the mono version
        omnisharp_mono = {
          enabled = true,
          -- Optional: Handlers like omnisharp-extended can be bound here if you use them
          handlers = {
            ["textDocument/definition"] = function(...)
              return require("omnisharp_extended").handler(...)
            end,
          },
          keys = {
            {
              "gd",
              function()
                require("omnisharp_extended").telescope_lsp_definition()
              end,
              desc = "Goto Definition",
            },
          },
        },
      },
    },
  },

  -- Include the extended LSP features (highly recommended for OmniSharp definition lookups)
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    lazy = true,
  },
}
