return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },

		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				--				defaults = { path_display = { "tail" } },
				defaults = {
					results_title = false,
					--					sorting_strategy = "ascending",
					layout_strategy = "center",
					layout_config = {
						preview_cutoff = 1, -- Preview should always show (unless previewer = false)
						anchor = "N",
						prompt_position = "top",
						mirror = true,
						width = function(_, max_columns, _)
							return math.min(max_columns, 120)
						end,
						height = function(_, _, max_lines)
							return math.min(max_lines, 15)
						end,
					},
					border = true,
					borderchars = {
						prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
						results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
						preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
