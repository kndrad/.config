-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


return require('packer').startup(function(use)
    -- packer
    use { 'wbthomason/packer.nvim' }
    use '~/gopkg-docs/'
    use 'rktjmp/lush.nvim'
    --------------------------------------------------
    ---                  PLUGINS                   ---
    --------------------------------------------------
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'BurntSushi/ripgrep' },
        }
    }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    }

    use {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup()
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        after = { 'nvim-treesitter', },
        config = function()
            require('treesitter-context').setup({})
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-refactor'
    }
    use {
        'nvim-treesitter/playground'
    }

    use {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim'
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',

        requires = {
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-nvim-lsp-signature-help' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'L3MON4D3/LuaSnip' },
        }
    }
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use { "folke/neodev.nvim" }

    use { 'mbbill/undotree' }

    use { 'tpope/vim-fugitive' }

    use { "terrortylor/nvim-comment",
        config = function()
            require('nvim_comment').setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                log_level = "error",
                auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
            }
        end
    }

    use 'nvim-tree/nvim-web-devicons'
    use {
        'echasnovski/mini.statusline',
        -- config = function()
        -- require('mini.statusline').setup()
        -- end
    }
    --
    -- use {
    --     'nvim-lualine/lualine.nvim',
    --     requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    --     config = function()
    --         require('lualine').setup({
    --             options = { theme = 'rose-pine' },
    --             sections = {
    --                 lualine_c = { require('auto-session.lib').current_session_name, 'filename' }
    --             }
    --         })
    --     end
    -- }



    use {
        'kevinhwang91/nvim-bqf',
        ft = 'qf',
    }
    use {
        'junegunn/fzf',
        run = function()
            vim.fn['fzf#install']()
        end,
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use {
        'stevearc/oil.nvim',
        config = function() require('oil').setup() end
    }
    -- golang
    use { 'mattn/vim-goimports' }
    --  use {
    --      'fatih/vim-go',
    --      run = ':GoUpdateBinaries',
    --   }
    -- use {
    --     'ray-x/go.nvim',
    --     requires = {
    --         'ray-x/guihua.lua', -- floating window supp
    --         'neovim/nvim-lspconfig',
    --         'nvim-treesitter/nvim-treesitter',
    --     },
    -- }
    -- -- --
    -- use {
    --     "olexsmir/gopher.nvim",
    --     requires = { -- dependencies
    --         "nvim-lua/plenary.nvim",
    --         "nvim-treesitter/nvim-treesitter",
    --     },
    --     run = ':GoInstallDeps',
    -- }
    use {
        'mfussenegger/nvim-dap'
    }

    use { 'jghauser/follow-md-links.nvim' }

    ------------- END OF PLUGINS LIST ----------
    --------------------------------------------
    -- Auto sync setup configs
    -- Put this at the end after all plugins are "used"
    if packer_bootstrap then
        require('packer').sync()
    end
end)
