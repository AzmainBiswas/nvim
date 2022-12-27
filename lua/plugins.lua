vim.cmd [[packadd packer.nvim]]

return require ('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'
    -- load faster --
    use {'lewis6991/impatient.nvim',
        config = function() require('impatient') end 
    }

    -- finder in vim
    use {'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                         , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- file tree in vim

    --use {'kyazdani42/nvim-tree.lua',
        --requires = {
            --'kyazdani42/nvim-web-devicons', -- optional, for file icons
        --},
        --tag = 'nightly' -- optional, updated every week. (see issue #1193)
    --}

    -- hexcolor indecator
    use({
        'norcalli/nvim-colorizer.lua',
        event = 'CursorHold',
        config = function()
            require('colorizer').setup()
        end,
    })
    -- status bar in nvim
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- indent blankline
    -- use 'lukas-reineke/indent-blankline.nvim'
    -- bufferline--
    -- use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    --beter syntex highlight --
    use "nvim-treesitter/nvim-treesitter"

    -- compliction
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }    
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    --spell check
    use 'inkarkat/vim-SpellCheck'
    use 'inkarkat/vim-ingo-library'


    --tatex
    use 'lervag/vimtex'
    use 'SirVer/ultisnips'
    -- colorscheme
    use {'dracula/vim', as = 'dracula'}
    use({
        'rose-pine/neovim',
        as = 'rose-pine'
    })
    -- use "EdenEast/nightfox.nvim"
end)

