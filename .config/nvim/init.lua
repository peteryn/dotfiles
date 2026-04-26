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

vim.pack.add({
	'https://github.com/projekt0n/github-nvim-theme',
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main'},
	'http://github.com/neovim/nvim-lspconfig'
})

vim.cmd('colorscheme github_dark_default')

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', "css", "go", "python" }

vim.api.nvim_create_autocmd('FileType', {
	callback = function(args)
		local language = vim.treesitter.language.get_lang(args.match)
		if not language then return end
		if not vim.treesitter.language.add(language) then return end
		vim.treesitter.start(args.buf, language)
	end,
})

vim.opt.completeopt = { 'menuone', 'noinsert', 'popup' }

vim.lsp.enable('lua_ls')
vim.lsp.enable('gopls')

vim.o.completeopt = "menuone,fuzzy,popup,preinsert"
vim.o.autocomplete = true
