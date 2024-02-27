-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'folke/tokyonight.nvim'
  use 'rose-pine/neovim'
  use 'jacoborus/tender.vim'
  use 'ellisonleao/gruvbox.nvim'

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('ThePrimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use('j-hui/fidget.nvim')
  use('tpope/vim-sleuth')
  use('akinsho/toggleterm.nvim')
  use({
          "lmburns/lf.nvim",
          requires = {"nvim-lua/plenary.nvim", "akinsho/toggleterm.nvim"}
      }
  )
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
  use('lukas-reineke/indent-blankline.nvim')
  use('tpope/vim-surround')
  use({'nvim-telescope/telescope-fzf-native.nvim',
       run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  })
  use 'mfussenegger/nvim-jdtls'
  use 'folke/which-key.nvim'
end)
