return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "tweekmonster/django-plus.vim",
  {
    "echasnovski/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup()
    end,
  },
}
