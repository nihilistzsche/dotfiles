return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      local lint = require("lint")

      -- Configure ShellCheck arguments specifically for PKGBUILD style files
      lint.linters.shellcheck.args = {
        "--format",
        "json",
        "--shell=bash", -- Force bash rules
        "--exclude=SC2034,SC2154,SC2164", -- Ignore "unused variable" errors on pkgname/pkgdesc
        "-",
      }

      lint.linters_by_ft = {
        sh = { "shellcheck" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
