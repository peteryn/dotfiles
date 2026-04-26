-- ~/.config/nvim-new/lua/plugins.lua
vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require('gitsigns').setup({ signcolumn = false })

-- ~/.config/nvim-new/lua/plugins.lua
vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup({})

-- ~/.config/nvim-new/lua/plugins.lua
vim.pack.add({
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require('blink.cmp').setup({
    fuzzy = { implementation = 'prefer_rust_with_warning' },
    signature = { enabled = true },
    keymap = {
        preset = "default",
        -- ["<C-e>"] = { "hide" },
    },

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
    },

    sources = { default = { "lsp" } }
})

vim.pack.add({'https://github.com/projekt0n/github-nvim-theme'})

vim.cmd('colorscheme github_dark_default')

--vim.pack.add({ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main'})
vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter'})

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

