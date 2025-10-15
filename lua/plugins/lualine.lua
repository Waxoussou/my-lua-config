return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "dracula",
		},
		sections = {
			lualine_c = {
				{
					"filename",
					path = 1, -- 0 = nom seul, 1 = chemin relatif, 2 = chemin absolu
				},
			},
		},
	},
}
