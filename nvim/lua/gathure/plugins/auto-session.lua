return {
  "rmagatti/auto-session",
  -- must stay eager: auto-save hangs off a VimLeavePre autocmd created in setup()
  lazy = false,
  opts = {
    -- renamed upstream from auto_restore_enabled / auto_session_suppress_dirs
    auto_restore = false,
    suppressed_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
    -- registering the telescope extension at setup pulled telescope into
    -- startup; :Telescope session-lens still works once telescope has loaded
    session_lens = {
      load_on_setup = false,
    },
  },
  config = function(_, opts)
    require("auto-session").setup(opts)

    local keymap = vim.keymap

    -- restore last workspace session for current directory
    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
    -- save workspace session for current working directory
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
  end,
}
