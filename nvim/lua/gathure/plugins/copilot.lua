-- Loaded as a dependency of nvim-cmp (InsertEnter). copilot-cmp registers the
-- "copilot" completion source, so it has to be set up before cmp.setup() runs.
return {
  "zbirenbaum/copilot-cmp",
  -- a top-level spec defaults to eager even when another plugin depends on it,
  -- so this has to be marked lazy explicitly
  lazy = true,
  dependencies = {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
      },
    },
  },
  config = function()
    require("copilot_cmp").setup()
  end,
}
