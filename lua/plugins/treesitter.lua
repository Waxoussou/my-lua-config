return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "lua", "javascript", "typescript", "vue", "java", "dart", "html", "css" },
            highlight = { enable = true },
            auto_install = true,
        })
    end,
}
