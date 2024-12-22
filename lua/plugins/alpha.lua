return {
  'goolord/alpha-nvim',
  dependencies = { 'echasnovski/mini.icons' },
  opts = function ()
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

--    local function pick_color()
--        local colors = {"String", "Identifier", "Keyword", "Number"}
--        return colors[math.random(#colors)]
--    end
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.header.opts.hl = "Identifier"
--    dashboard.section.header.opts = { hl = { {"AlphaHeader",13,20 }} }
    return dashboard
  end,

  config = function ()
      require'alpha'.setup(require'alpha.themes.dashboard'.config)
  end
}
