return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "vue_ls"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local mason_registry = require("mason-registry")
            local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
                .. "/node_modules/@vue/language-server"
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_language_server_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetype = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })
            lspconfig.volar.setup({
                capabilities = capabilities,
            })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set({ "n" }, "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set({ "n" }, "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n" }, "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
            vim.diagnostic.config({ virtual_text = true })
        end,
    },
}

