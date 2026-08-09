return {
  "andymass/vim-matchup",
  event = { "BufReadPost", "BufNewFile" },
  -- matchup reads its g: options while loading, so they cannot wait for config()
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
