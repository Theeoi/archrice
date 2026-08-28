-- Configuration variables for lsp.lua, linting.lua and formatting.lua
return {
	-- Every mason-managed package belongs here.
	mason = {
		"bash-language-server",
		"basedpyright",
		"shellcheck",
		"lua-language-server",
		"stylua",
		"ruff",
		"ltex-ls-plus",
		"djlint",
		"shfmt",
		"tex-fmt",
		"json-lsp",
		"prettier",
		"yaml-language-server",
		"yamllint",
	},

	lsp = {
		bashls = {
			filetypes = { "sh", "bash" },
			root_markers = {},
		},
		lua_ls = {
			filetypes = { "lua", "luau" },
			root_markers = { "init.lua" },
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		},
		basedpyright = {
			filetypes = { "python" },
			root_markers = { "pyproject.toml" },
		},
		ltex_plus = {
			filetypes = { "tex", "markdown", "text" },
			root_markers = {},
		},
		jsonls = {
			filetypes = { "json", "jsonc" },
			settings = {
				json = {
					validate = { enable = true },
				},
			},
		},
		yamlls = {
			filetypes = { "yaml" },
			root_markers = {},
		},
	},

	formatters_by_ft = {
		lua = { "stylua" },
		luau = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		markdown = { "prettier" },
		text = {},
		jinja = { "djlint" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		tex = { "tex-fmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
	},

	formatters = {
		stylua = {
			prepend_args = { "--column-width", "80" },
		},
		ruff_format = {
			append_args = { "--line-length", "80" },
		},
		djlint = {
			prepend_args = { "--max-line-length", "80" },
		},
		prettier = {
			prepend_args = {
				"--tab-width",
				"4",
				"--use-tabs",
				"false",
			},
		},
	},

	linters_by_ft = {
		lua = {},
		luau = {},
		python = { "ruff" },
		markdown = {},
		text = {},
		jinja = { "djlint" },
		sh = { "shellcheck" },
		bash = { "shellcheck" },
		tex = {},
		json = {},
		jsonc = {},
		yaml = { "yamllint" },
	},
}
