return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require "conform"

    conform.setup {
      formatters_by_ft = {
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        css = { "biome" },
        html = { "biome" },
        json = { "biome" },
        jsonc = { "biome" },
        graphql = { "biome" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "ruff_organize_imports", "ruff_format" },
        htmldjango = { "djangofmt" },
        django = { "djangofmt" },
        jinja = { "djangofmt" },
      },
      formatters = {
        -- not shipped with the pinned conform version yet; mirrors upstream
        djangofmt = {
          command = "djangofmt",
          args = { "--stdin-filename", "$FILENAME" },
          stdin = true,
        },
      },
      format_on_save = {
        lsp_format = "fallback",
        async = false,
      },
    }

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format {
        lsp_format = "fallback",
        async = false,
      }
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
