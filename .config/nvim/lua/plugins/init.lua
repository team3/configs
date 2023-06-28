local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  --use {'neoclide/coc.nvim', branch = 'release'}
  --LSP
  use 'neovim/nvim-lspconfig'
  use {
    'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/vim-vsnip',
        'onsails/lspkind.nvim',
    }
  }       

  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = 
    function()
        require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    end
  }

  -- tabs
  use 'nanozuki/tabby.nvim'

  -- Autosave files
  use({
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
  })

  -- Show where your cursor moves when jumping large distances
  use {'edluffy/specs.nvim'}

  use("L3MON4D3/LuaSnip") -- snippet engine
  use("LintaoAmons/scratch.nvim")
  use("saadparwaiz1/cmp_luasnip") -- for autocompletion
  -- Java                                                                                                                                                                                                                                                                               
  use 'mfussenegger/nvim-jdtls'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'uiiaoo/java-syntax.vim'

  use {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
    run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  }

  -- Unit tests
  --use 'vim-test/vim-test'

  -- Tree
  use {'nvim-tree/nvim-tree.lua',
    requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
    }
  }
  -- Find files, Find in files
  use {'nvim-telescope/telescope.nvim', tag = '0.1.1', requires = { {'nvim-lua/plenary.nvim'}}}
  use {'nvim-telescope/telescope-ui-select.nvim' }

  -- Color schemes
  --use 'rafi/awesome-vim-colorschemes'
  --use 'shaunsingh/nord.nvim'
  use "EdenEast/nightfox.nvim" -- Packer

  -- Lualine
  use 'nvim-lualine/lualine.nvim'
  -- Git related plugins
  use 'lewis6991/gitsigns.nvim'
  use 'f-person/git-blame.nvim'

  -- Scroll
  use 'dstein64/nvim-scrollview'

  -- Code folding
  use({"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"})

  -- Auto closing
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
  use({"windwp/nvim-ts-autotag", after = "nvim-treesitter"}) -- autoclose tags

   -- Treesitter configuration
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
    q,
  })

  -- Lazygit integration
  use("kdheepak/lazygit.nvim")

  -- UI
  use ({'lukas-reineke/indent-blankline.nvim',
    config = function()
      require("auto-save").setup({})
    end,
  })

  use {'stevearc/aerial.nvim',
    config = function() require('aerial').setup() end
  }
 
  use({'simrat39/symbols-outline.nvim',
    config = function()
        require("symbols-outline").setup { auto_close = true } 
    end,  
  })

  use ({'goolord/alpha-nvim',
    config = function ()
        require('alpha').setup(require'alpha.themes.startify'.config)
    end
  })

  use({
    'j-hui/fidget.nvim',
    config = function ()
      require('fidget').setup()
    end
  })

  use("vim-syntastic/syntastic")

  if packer_bootstrap then
    require('packer').sync()
  end
end)
