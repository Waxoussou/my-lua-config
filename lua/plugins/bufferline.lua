return {
  'akinsho/bufferline.nvim',
  version = "*", 
  dependencies = 'nvim-tree/nvim-web-devicons',
  opts = {
    options= {
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}

--  config = function()
--    vim.opt.termguicolors = true
--    require("bufferline").setup{}
--  end, 
