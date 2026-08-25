return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, "gotmpl")
      end
    end,
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = "*.tmpl",
        callback = function(ev)
          local file_name = vim.api.nvim_buf_get_name(ev.buf)
          local pre_ext = file_name:match("%.([^.]+)%.tmpl$")

          if pre_ext then
            if pre_ext == "yml" then
              pre_ext = "yaml"
            end
            if pre_ext == "tmpl" then
              return
            end

            -- Triggers the fish.gotmpl filetype
            vim.bo[ev.buf].filetype = pre_ext .. ".gotmpl"
          else
            vim.bo[ev.buf].filetype = "gotmpl"
          end
        end,
      })
    end,
  },
}
