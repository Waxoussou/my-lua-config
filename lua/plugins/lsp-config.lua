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
				ensure_installed = { "lua_ls", "ts_ls", "vue_ls", "vtsls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Chemin vers @vue/language-server (corrigé)
			local vue_language_server_path = vim.fn.stdpath("data")
				.. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
			local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }

			local vue_plugin = {
				name = "@vue/typescript-plugin",
				location = vue_language_server_path,
				languages = { "vue" },
				configNamespace = "typescript",
			}
			-- Configuration Lua LS
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("lua_ls")

			-- Configuration TypeScript avec plugin Vue
			local vtsls_config = {
				capabilities = capabilities,
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = tsserver_filetypes,
			}
            vim.lsp.config("vtsls", vtsls_config)
			-- vim.lsp.config("ts_ls", {
			-- 	capabilities = capabilities,
			-- 	init_options = {
			-- 		plugins = {
			-- 			{
			-- 				name = "@vue/typescript-plugin",
			-- 				location = vue_language_server_path,
			-- 				languages = { "vue" },
			-- 			},
			-- 		},
			-- 	},
			-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
			-- })

			-- Configuration Vue Language Server
			vim.lsp.config("vue_ls", {
				capabilities = capabilities,
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
			vim.diagnostic.config({ virtual_text = true })
		end,
	},
}
