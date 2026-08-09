return {
  "0xJohnnyboy/scretch.nvim",
  cmd = "Scretch",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    scretch_dir = vim.fn.stdpath "data" .. "/scretch/",
  },
  config = function(_, opts)
    require("scretch").setup(opts)
  end,
}
