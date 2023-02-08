local vim = vim
local opt = vim.opt

opt.number = true
opt.relativenumber = false

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.scrolloff = 5
opt.sidescrolloff = 5

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.cursorline = true

opt.mouse:append("a")
opt.clipboard:append("unnamedplus")

opt.hlsearch = true
opt.incsearch = true

opt.ignorecase = true
opt.smartcase = true

opt.swapfile = false
opt.autoread = true
vim.bo.autoread = true

opt.signcolumn = 'yes'
opt.list = true

opt.cursorline = true
opt.termguicolors = true

opt.updatetime = 300
opt.timeoutlen = 500

-- 外观
opt.termguicolors = true
opt.signcolumn = "yes"
-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true
