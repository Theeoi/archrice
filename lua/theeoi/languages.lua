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
		"biome",
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
			filetypes = { "tex", "latex", "markdown", "text" },
			root_markers = {},
		},

		biome = {
			filetypes = { "json", "jsonc" },
			root_markers = {},
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
		latex = { "tex-fmt" },
		json = { "biome" },
		jsonc = { "biome" },
		yaml = { "yamlfix" },
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
		latex = {},
		json = { "biomejs" },
		jsonc = { "biomejs" },
		yaml = { "yamllint" },
	},
}
