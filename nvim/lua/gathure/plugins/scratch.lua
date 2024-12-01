return {
  "mtth/scratch.vim",
  event = "VeryLazy",
  config = function()
    vim.g.scratch_persistence_file = vim.fn.stdpath "data" .. "/scratch"
    vim.keymap.set("n", "<leader>gsn", "<cmd>Scratch<CR>", { desc = "Open scratch buffer" })
  end,
}
