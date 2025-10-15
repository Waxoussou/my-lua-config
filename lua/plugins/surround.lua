return {
  "kylechui/nvim-surround",
  version = "*", -- Dernière version
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end
}
