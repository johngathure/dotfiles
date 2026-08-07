return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  -- the main branch does not support lazy-loading
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require "nvim-treesitter"

    require("nvim-ts-autotag").setup()

    treesitter.setup {
      -- parsers and queries are installed here (prepended to runtimepath)
      install_dir = vim.fn.stdpath "data" .. "/site",
    }

    -- ensure these language parsers are installed (no-op if already present)
    treesitter.install {
      "python",
      "javascript",
      "typescript",
      "sql",
      "json",
      "tsx",
      "yaml",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "graphql",
      "bash",
      "lua",
      "vim",
      "dockerfile",
      "gitignore",
      "query",
      "vimdoc",
    }

    -- highlighting and indentation are opt-in per buffer on the main branch
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("gathure_treesitter", { clear = true }),
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang or not vim.treesitter.language.add(lang) then
          return
        end

        -- enable syntax highlighting
        vim.treesitter.start(args.buf, lang)

        -- enable indentation (experimental upstream)
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
