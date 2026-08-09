return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    {
      -- used only for startify#fortune#cowsay(); the start screen itself stays
      -- off so it does not compete with alpha for the empty buffer
      "mhinz/vim-startify",
      init = function()
        vim.g.startify_disable_at_vimenter = 1
        -- rounded box borders instead of the ASCII *---* default
        vim.g.startify_fortune_use_unicode = 1
      end,
    },
  },
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    -- Set header. startify picks the quote from reltime() microseconds, so it
    -- varies per launch (unlike the unseeded math.random it was ported to).
    dashboard.section.header.val = vim.fn["startify#fortune#cowsay"]()

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
      dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
      dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
      dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd [[autocmd FileType alpha setlocal nofoldenable]]
  end,
}
