return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = 15, -- Height of the terminal
      open_mapping = [[<C-\>]], -- Shortcut to open/close it
      direction = "horizontal", -- Force it to open at the bottom
      start_in_insert = true, -- Immediately let you type
    })
  end,
}
