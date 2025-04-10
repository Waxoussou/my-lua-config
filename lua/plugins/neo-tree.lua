return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },

  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
    },
  },
  keys = {
    { "<C-e>", "<Cmd>Neotree toggle<CR>", desc = "Toggle NeoTree" },
  }

}
