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
    group = 'TerminalCustomizations',
    pattern = "term://*",
    command = "startinsert"
})

-- allow <Esc> to be used to enter normal mode in terminal
-- vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

-- kill terminal when using nvr
-- local function kill_terminal_on_nvr()
--     if vim.bo.buftype == 'terminal' then
--         local term_job_id = vim.b.terminal_job_id
--         vim.api.nvim_create_autocmd("BufEnter", {
--             callback = function()
--                 if vim.b.term_job_id ~= nil and vim.b.term_job_id ~= vim.b.terminal_job_id then
--                     vim.api.nvim_buf_delete(0, {force = true})
--                 end
--             end
--         })
--     end
-- end
--
-- vim.api.nvim_create_autocmd("TermOpen", {callback = kill_terminal_on_nvr})
-- vim.api.nvim_create_autocmd("TermOpen", {
--     pattern = "*",
--     callback = function()
--         if vim.bo.buftype == 'terminal' then
--             local term_bufnr = vim.api.nvim_get_current_buf()
--             vim.api.nvim_create_autocmd("BufEnter", {
--                 pattern = "*",
--                 once = true,
--                 callback = function()
--                     local new_bufnr = vim.api.nvim_get_current_buf()
--                     if new_bufnr ~= term_bufnr then
--                         vim.api.nvim_buf_delete(term_bufnr, {force = true})
--                     end
--                 end
--             })
--         end
--     end
-- })


