return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
	opts = function()
		local dashboard = require("alpha.themes.dashboard")
		local logo = [[

                            :::::
                         :::::::::::
                      :::::::::::::::::
                   ::::::           ::::::
                  :::::     +++++     :::::
                  ::::   +++++++++++   ::::
                  ::::-+++++++++++++++-::::
                  :==++++++++   ++++++++==:
               :::-+++++++         +++++++-:::
            ::::::-++++               ++++-::::::
            ::::::=++++               ++++=::::::
            ::::: +++++               +++++ :::::
            ::::: +++++               +++++ :::::
            ::::: +++++               +++++ :::::
            ::::: +++++++++       +++++++++ :::::
            :::::  +++++++++++ +++++++++++  :::::
            ::::::    +++++++++++++++++    ::::::
             :::::::     ===+++++===     :::::::
                :::::::::::::-=-:::::::::::::
                   ::::::::::: :::::::::::
                      ::::         ::::


██████  ██      ██    ██ ███████ ███    ███ ██ ███    ██ ██████
██   ██ ██      ██    ██ ██      ████  ████ ██ ████   ██ ██   ██
██████  ██      ██    ██ █████   ██ ████ ██ ██ ██ ██  ██ ██   ██
██   ██ ██      ██    ██ ██      ██  ██  ██ ██ ██  ██ ██ ██   ██
██████  ███████  ██████  ███████ ██      ██ ██ ██   ████ ██████



    ]]

		dashboard.section.header.val = vim.split(logo, "\n")
		dashboard.section.header.opts.hl = "Identifier"
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰈞  Find file", ":Telescope find_files <CR>"),
			-- dashboard.button("p", "󰈞  Find project", ":Telescope projects <CR>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}
		--    dashboard.section.header.opts = { hl = { {"AlphaHeader",13,20 }} }
		dashboard.section.header.opts.hl = "GruvboxBlue"

		return dashboard
	end,

	config = function()
		require("alpha").setup(require("alpha.themes.dashboard").config)
	end,
}
