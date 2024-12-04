return {
  "0xJohnnyboy/scretch.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("scretch").setup {
      scretch_dir = vim.fn.stdpath "data" .. "/scretch/",
    }
  end,
}
