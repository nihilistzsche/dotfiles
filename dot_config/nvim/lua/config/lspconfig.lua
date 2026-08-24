local lspconfig = require("lspconfig")

vim.lsp.enable("termux_language_server")

-- 2. Configure individual servers directly using nvim-lspconfig
-- (setup_handlers has been deleted; configure servers explicitly instead)

-- Your custom smart-setup for lua_ls
lspconfig.lua_ls.setup({
  on_init = function(client)
    local workspace = client.workspace_folders and client.workspace_folders[1]
    if not workspace then
      return
    end
    local path = workspace.name

    -- Skip Neovim paths if a local config already exists
    if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
      return
    end

    -- Inject Neovim environment definitions dynamically
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua or {}, {
      runtime = {
        version = "LuaJIT",
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config"),
          vim.fn.stdpath("data") .. "/lazy",
        },
      },
    })

    -- Force the server to reload with the new injected settings
    client:notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
})

vim.lsp.enable("cspell_ls")
vim.lsp.config("cspell_ls", {
  cmd = { "cspell-lsp", "--stdio" },
  filetypes = {
    "lua",
    "python",
    "javascript",
    "typescript",
    "html",
    "css",
    "init",
    "txt",
    "json",
    "yaml",
    "markdown",
    "gitcommit",
  },
  root_markers = { ".git" },
})
