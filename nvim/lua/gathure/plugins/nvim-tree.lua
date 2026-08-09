return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFileToggle", "NvimTreeCollapse", "NvimTreeRefresh", "NvimTreeOpen" },
  keys = {
    { "<leader>ee", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
    { "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", desc = "Toggle file explorer on current file" },
    { "<leader>ec", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
    { "<leader>er", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
  },
  -- netrw has to be disabled before it loads, so this cannot wait for config()
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    view = {
      width = 35,
      relativenumber = true,
    },
    -- change folder arrow icons
    renderer = {
      indent_markers = {
        enable = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "", -- arrow when folder is closed
            arrow_open = "", -- arrow when folder is open
          },
        },
      },
    },
    -- disable window_picker for
    -- explorer to work well with
    -- window splits
    actions = {
      open_file = {
        window_picker = {
          enable = false,
        },
      },
    },
    filters = {
      custom = { ".DS_Store", ".git", "node_modules", ".venv" },
    },
    git = {
      ignore = false,
    },
  },
}
