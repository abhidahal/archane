return require("packer").startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	use("github/copilot.vim")

	-- misc plugins
	use("dstein64/vim-startuptime")
	use("folke/zen-mode.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("sbdchd/neoformat")
	use("mbbill/undotree")
	use("lukas-reineke/indent-blankline.nvim")

	use("luochen1990/rainbow")

	use("lewis6991/gitsigns.nvim")
	use({
		"kylechui/nvim-surround",
		tag = "*",
	})
	use("numToStr/Comment.nvim")
	use("vimwiki/vimwiki")

	-- colorsscheme
	use("abhidahal/onsetGlaze.nvim")
	use("folke/tokyonight.nvim")

	-- tpope plugins
	use("tpope/vim-repeat")

	-- a better status line
	use("nvim-lualine/lualine.nvim")

	-- use("s1n7ax/nvim-terminal")
	use("kyazdani42/nvim-tree.lua")

	-- telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")
	use("nvim-telescope/telescope.nvim")

	-- treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("romgrk/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	-- lsp
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind.nvim")

	-- nvim-cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- Luasnip
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- Debugger
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use("theHamsta/nvim-dap-virtual-text")
	use("nvim-telescope/telescope-dap.nvim")
	use("ravenxrz/DAPInstall.nvim")

	use("mfussenegger/nvim-dap-python")
	use("leoluz/nvim-dap-go")

	-- language support
	use("pangloss/vim-javascript") -- js support
	use("leafgarland/typescript-vim") -- ts support
	use("maxmellon/vim-jsx-pretty") -- JS and JSX syntax
	-- use("jparise/vim-graphql") -- GraphQL syntax
	use("mattn/emmet-vim")

	-- dart
	use("dart-lang/dart-vim-plugin")
	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		filetypes = { "dart" },
	})

	-- terraform
	-- use({
	-- 	"nathom/filetype.nvim",
	-- 	config = function()
	-- 		require("filetype").setup({
	-- 			overrides = {
	-- 				extensions = {
	-- 					tf = "terraform",
	-- 					tfvars = "terraform",
	-- 					tfstate = "json",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- })
end)
