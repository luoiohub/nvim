local vim = vim

-- 引导 lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- lazy.nvim 配置
require("lazy").setup({
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    "folke/tokyonight.nvim",
    "neovim/nvim-lspconfig",
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        opts = {
            -- config
        },
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    }
})
