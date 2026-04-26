vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = false

-- number of character spaces per tab
vim.opt.tabstop = 4
-- number of character spaces for auto/manual indent
vim.opt.shiftwidth = 4
-- tabs do not become spaces
vim.opt.expandtab = false
-- tab character
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- conrols how many lines must be shown
vim.opt.scrolloff = 8

-- Save undo history
--vim.o.undofile = true

-- stop newlines from adding a comment
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

vim.opt.signcolumn = "yes:1" -- Always show sign column
