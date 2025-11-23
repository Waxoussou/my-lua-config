-- Fonction pour savoir si on est strictement dans HOME
local function above_home()
	local cwd = vim.fn.getcwd()
	local home = os.getenv("HOME")
	-- cwd doit commencer par HOME et ne doit pas être exactement HOME
	return cwd:sub(1, #home) == home and cwd ~= home
end

local function get_visual_selection()
	vim.cmd("normal! ")
	local bufnr = vim.api.nvim_get_current_buf()
	local start_pos = vim.api.nvim_buf_get_mark(bufnr, "<")
	local end_pos = vim.api.nvim_buf_get_mark(bufnr, ">")
	local start_line, start_col = start_pos[1], start_pos[2]
	local end_line, end_col = end_pos[1], end_pos[2]

	-- récupère les lignes sélectionnées
	local lines = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, end_line, false)
	if #lines == 0 then
		return ""
	end

	-- sélection sur une seule ligne
	if start_line == end_line then
		return string.sub(lines[1], start_col + 1, end_col + 1)
	end

	-- multi-lignes : tronque la première et dernière ligne aux colonnes
	lines[1] = string.sub(lines[1], start_col + 1)
	lines[#lines] = string.sub(lines[#lines], 1, end_col + 1)

	-- concatène toutes les lignes avec \n
	return table.concat(lines, "\n")
end
return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<C-p>", function()
				builtin.find_files({
					no_ignore = above_home(),
					hidden = above_home(),
				})
			end)
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fg", function()
				local opts = {}
				if above_home() then
					opts = {
						additional_args = function()
							return { "--ignore-case", "--hidden", "--glob", "!.git/*" }
						end,
					}
				end
				builtin.live_grep(opts)
			end, { desc = "Live grep all (hidden files)" })

			vim.keymap.set("n", "<leader>b", builtin.buffers, {})
			vim.keymap.set("n", "g/", builtin.grep_string, {})
			vim.keymap.set("v", "g/", function()
				local selection = get_visual_selection()
				builtin.grep_string({
					search = selection,
				})
			end, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local layout = {
				results_title = false,
				sorting_strategy = "ascending",
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
						return math.min(max_lines, 10)
					end,
				},
				border = true,
				borderchars = {
					prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
					results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
					preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				},
			}
			require("telescope").setup({
				--				defaults = { path_display = { "tail" } },
				pickers = {
					find_files = layout,
					git_commits = layout,
					git_branches = layout,
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_cursor({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
