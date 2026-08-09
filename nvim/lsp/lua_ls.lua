-- Per-server overrides picked up by vim.lsp.config() from the runtimepath.
-- Merged on top of nvim-lspconfig's own lsp/lua_ls.lua.
return {
  settings = {
    Lua = {
      -- make the language server recognize the "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}
