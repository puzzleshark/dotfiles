vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- need to remove this for Makefiles
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.g.mapleader = " "

vim.opt.clipboard = 'unnamedplus'

-- set autocommand to remove autocreating comments
vim.api.nvim_command('autocmd FileType * set formatoptions-=r')
vim.api.nvim_command('autocmd FileType * set formatoptions-=o')
