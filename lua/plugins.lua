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
    use "wbthomason/packer.nvim"

    use "folke/which-key.nvim"

    use "folke/tokyonight.nvim"

    use "folke/neodev.nvim"

    use { "folke/neoconf.nvim", cmd = "Neoconf" }

    use "neovim/nvim-lspconfig"

    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
                theme = 'hyper', --  theme is doom and hyper default is hyper
                --  config used for theme
                config = {
                    shortcut = {
                        -- action can be a function type
                        { desc = string, group = 'highlight group', key = 'shortcut key',
                            action = 'action when you press key' },
                    },
                    packages = { enable = true }, -- show how many plugins neovim loaded
                    -- limit how many projects list, action when you press key or enter it will run this action.
                    project = { limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
                    mru = { limit = 10, icon = 'your icon', label = '', },
                    footer = {}, -- footer
                },
            }
        end,
        requires = { 'nvim-tree/nvim-web-devicons' }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
