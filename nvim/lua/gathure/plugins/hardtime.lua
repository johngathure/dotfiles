return {
  "m4xshen/hardtime.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  -- opts must stay, even empty: hardtime ships no plugin/ dir, so without it
  -- lazy never calls setup() and the plugin does nothing at all
  opts = {},
}
