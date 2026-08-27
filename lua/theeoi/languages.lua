-- Every Mason-managed package belongs in mason; startup cleanup removes
-- anything unlisted. Integration identifiers remain deliberately separate.
return {
	mason = {
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
		"yamlfix",
		"yamllint",
	},

	lsp = {
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

		ruff = {
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
		markdown = {},
		text = {},
		jinja = { "djlint" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		tex = { "tex-fmt" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "yamlfix" },
	},

	formatters = {
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
		python = {},
		markdown = {},
		text = {},
		jinja = { "djlint" },
		sh = {},
		bash = {},
		tex = {},
		json = {},
		jsonc = {},
		yaml = { "yamllint" },
	},
}
