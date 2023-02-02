local vim = vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

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

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Simple plugins can be specified as strings
    use 'rstacruz/vim-closer'

    -- Plugins can have dependencies on other plugins
    use {
        'haorenW1025/completion-nvim',
        opt = true,
        requires = { { 'hrsh7th/vim-vsnip', opt = true }, { 'hrsh7th/vim-vsnip-integ', opt = true } }
    }

    -- Plugins can also depend on rocks from luarocks.org:
    use {
        'my/supercoolplugin',
        rocks = { 'lpeg', { 'lua-cjson', version = '2.1.0' } }
    }

    -- Plugins can have post-install/update hooks
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

    -- Post-install/update hook with neovim command
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Post-install/update hook with call of vimscript function with argument
    use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

    -- Use specific branch, dependency and run lua file after load
    use {
        'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'statusline' end,
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- Use dependency and run lua function after load
    use {
        'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
        config = function() require('gitsigns').setup() end
    }

    -- You can specify multiple plugins in a single call
    use { 'tjdevries/colorbuddy.vim', { 'nvim-treesitter/nvim-treesitter', opt = true } }

    -- You can alias plugin names
    use { 'dracula/vim', as = 'dracula' }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
