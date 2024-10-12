vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	--Packer Installation
	use 'wbthomason/packer.nvim'

	-- For the LSP
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp"
	}
	-- Snippets
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use {
	  'nvim-telescope/telescope.nvim',
	  tag = '0.1.8',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Theme
	use { "rose-pine/neovim", as = "rose-pine" }
	use { "catppuccin/nvim", as = "catppuccin" }
end)
