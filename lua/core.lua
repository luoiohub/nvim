local vim = vim

-- 行号
vim.opt.number = true
vim.opt.relativenumber = false

-- 缩进
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.cursorline = true -- 光标所在行高亮
vim.opt.cursorcolumn = true -- 光标所在列高亮
vim.opt.scrolloff = 8 -- 光标距离顶部和底部8行
vim.opt.sidescrolloff = 8 -- 光标距离左边和右边8列

vim.opt.updatetime = 300 -- 保存文件自动更新
vim.opt.timeoutlen = 500 -- 按键超时时间
vim.opt.hidden = true -- 允许在有未保存的修改时切换缓冲区

-- 搜索
vim.opt.hlsearch = true -- 搜索高亮
vim.opt.incsearch = true -- 搜索时逐字符高亮
vim.opt.ignorecase = true -- 搜索时忽略大小写
vim.opt.smartcase = true -- 搜索时忽略大小写

-- 默认新窗口
vim.opt.splitright = true -- 新窗口右边
vim.opt.splitbelow = true -- 新窗口下边

-- 系统剪贴板
-- vim.opt.clipboard = "unnamedplus"
vim.opt.clipboard:append("unnamedplus")

-- 启用鼠标
vim.opt.mouse:append("a")

vim.opt.completeopt = "menuone,noselect" -- 补全菜单
vim.opt.shortmess:append "c" -- 不显示插件更新信息
vim.opt.shortmess:append "I" -- 不显示启动画面
vim.opt.shortmess:append "W" -- 不显示警告信息
vim.opt.shortmess:append "A" -- 不显示文件末尾加号
vim.opt.shortmess:append "O" -- 不显示文件末尾的信息
vim.opt.shortmess:append "T" -- 不显示文件末尾的信息
vim.opt.shortmess:append "F" -- 不显示文件末尾的信息
vim.opt.shortmess:append "S" -- 不显示文件末尾的信息

vim.opt.wrap = false -- 关闭自动换行
vim.opt.list = true -- 显示可打印字符
vim.opt.listchars:append "space:⋅" -- 空格显示
-- vim.opt.listchars:append "eol:↴" -- 换行符显示
vim.opt.listchars:append "tab:▷⋅" -- 制表符显示
vim.opt.listchars:append "trail:·" -- 行尾空格显示
vim.opt.listchars:append "extends:❯" -- 可折叠区域显示
vim.opt.listchars:append "precedes:❮" -- 可折叠区域显示
