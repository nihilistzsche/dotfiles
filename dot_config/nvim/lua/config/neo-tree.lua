require("neo-tree").setup({
  filesystem = {
    filtered_items = {
      visible = true, -- This reveals hidden files
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
})
