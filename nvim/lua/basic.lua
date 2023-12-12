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

-- define an autocommand group for terminal-related commands
vim.api.nvim_create_augroup('TerminalCustomizations', { clear = true })

-- disable line numbers in terminal mode
vim.api.nvim_create_autocmd('TermOpen', {
    group = 'TerminalCustomizations',
    pattern = 'term://*',
    command = 'setlocal nonumber norelativenumber'
})

-- re-enable line numbers when leaving terminal mode
vim.api.nvim_create_autocmd('TermClose', {
    group = 'TerminalCustomizations',
    pattern = 'term://*',
    command = 'setlocal number relativenumber'
})

-- automatically enter insert mode when opening terminal
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "term://*",
    command = "startinsert"
})

-- allow <Esc> to be used to enter normal mode in terminal
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

