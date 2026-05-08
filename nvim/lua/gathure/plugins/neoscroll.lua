return {
  {
    "karb94/neoscroll.nvim",
    opts = { enabled = True },
    config = function(_, opts)
      local neoscroll = require "neoscroll"
      neoscroll.setup(opts)

      local keymap = {

        ["<Down>"] = function()
          neoscroll.scroll(0.1, { move_cursor = false, duration = 100 })
        end,
        ["<Up>"] = function()
          neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 })
        end,
      }

      local modes = { "n", "v", "x" }

      for key, func in pairs(keymap) do
        vim.keymap.set(modes, key, func)
      end
    end,
  },
}
