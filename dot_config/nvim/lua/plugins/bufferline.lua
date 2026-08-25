return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        custom_filter = function(buf_number, _)
          -- Get the name of the buffer
          local name = vim.api.nvim_buf_get_name(buf_number)

          -- Exclude buffers with no name (empty string)
          if name == "" then
            return false
          end

          return true
        end,
      },
    },
  },
}
