-- mason 2.x lives under the mason-org org (the williamboman repos are redirects)
-- and requires Neovim 0.11+.
--
-- mason itself is only loaded on demand: nvim-lspconfig pulls it in via
-- mason-lspconfig on BufReadPre, so the registry/installer stack no longer runs
-- during startup. mason-lspconfig is declared in lspconfig.lua as a dependency.
return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        "prettier", -- prettier formatter
        "stylua", -- lua formatter
        "isort", -- python formatter
        "black", -- python formatter
        "pylint",
        "eslint_d",
        "djlint", -- django/jinja template formatter + linter
      },
      -- keep the install check off the critical path of opening a file
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 24,
    },
  },
}
