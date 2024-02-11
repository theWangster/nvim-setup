return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		priority = 1000,
		opts = {
			load = {
				["core.defaults"] = {},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		config = function()
			local wk = require("which-key")
			wk.register(mappings, opts)
		end,
	},
	{
		"windwp/nvim-autopairs",
		enabled = false,
	},
	{
		"vimwiki/vimwiki",
		lazy = true,
		init = function()
			vim.g.vimwiki_list = { { path = "~/Documents/Mywiki", syntax = "markdown", ext = ".md" } }
			vim.g.vimwiki_global_ext = 0
		end,
		keys = { "<leader>ww", "<leader>w<leader>w", "<leader>w<leader>y", "<leader>w<leader>m" },
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		opts = {
			ensure_installed = {
				"clangd",
				"rust-analyzer",
			},
		},
		config = function()
			local mason = require("mason")
			local mason_tool_installer = require("mason-tool-installer")
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},

				mason_tool_installer.setup({
					ensure_installed = {
						-- "prettier",
						"stylua",
						"flake8",
						"clang-format",
						"isort",
						"black",
					},
				}),
			})
		end,
	},
	{
		"williamboman/mason-lspconfig",
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			require("lsp_config")
		end,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				python = { "flake8" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Lint Current File" })
		end,
	},
	{
		"mfussenegger/nvim-dap",
	},
	{
		"mhartington/formatter.nvim",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "cpp", "rust", "python", "lua", "vim", "vimdoc", "query", "html" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
	},
	{
		-- https://www.josean.com/posts/neovim-linting-and-formatting
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					html = { "prettier" },
					css = { "prettier" },
					lua = { "stylua" },
					cpp = { "clang-format" },
					python = { "isort", "black" },
					-- https://clang.llvm.org/docs/ClangFormatStyleOptions.html
					-- Make .clang-format in home dir
					-- Include:
					-- BasedOnStyle: LLVM
					-- UseTab: Always
					-- IndentWidth: 4
					-- TabWidth: 4
					-- DerivePointerAlignment: false
					-- PointerAlignment: Left
					-- ColumnLimit: 100
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				},
			})
			--[[
			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_format = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file" })
			]]
			--
		end,
	},
}
