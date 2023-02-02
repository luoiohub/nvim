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
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
            -- require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    }

    -- use {
    --     'glepnir/dashboard-nvim',
    --     event = 'VimEnter',
    --     config = function()
    --         require('dashboard').setup {
    --             -- config
    --             theme = 'hyper',
    --             config = {
    --                 week_header = {
    --                     enable = true,
    --                 },
    --                 shortcut = {
    --                     { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
    --                     {
    --                         desc = ' Files',
    --                         group = 'Label',
    --                         action = 'Telescope find_files',
    --                         key = 'f',
    --                     },
    --                     {
    --                         desc = ' Apps',
    --                         group = 'DiagnosticHint',
    --                         action = 'Telescope app',
    --                         key = 'a',
    --                     },
    --                     {
    --                         desc = ' dotfiles',
    --                         group = 'Number',
    --                         action = 'Telescope dotfiles',
    --                         key = 'd',
    --                     },
    --                     { icon = "  ", desc = 'Recently lastest session    ', shortcut = "Leader s l", action = "" },
    --                     { icon = "  ", desc = "Recently opened files       ", shortcut = "Leader f h", action = "" },
    --                     { icon = "  ", desc = "Find File                   ", shortcut = "leader f f", action = "" },
    --                     { icon = "  ", desc = "File Browser                ", shortcut = "leader f b", action = "" },
    --                     { icon = "  ", desc = "Find Word                   ", shortcut = "leader f w", action = "" },
    --                     { icon = "  ", desc = "Open Personal dotfiles      ", shortcut = "leader e e",
    --                         action = "edit $MYVIMRC" },
    --                 },
    --                 packages = { enable = true }, -- show how many plugins neovim loaded
    --                 -- limit how many projects list, action when you press key or enter it will run this action.
    --                 project = { limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
    --                 mru = { limit = 10, icon = 'your icon', label = '', },
    --                 footer = {}, -- footer
    --             },
    --         }
    --     end,
    --     requires = { 'nvim-tree/nvim-web-devicons' }
    -- }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
