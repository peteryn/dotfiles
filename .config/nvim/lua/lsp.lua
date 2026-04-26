-- ~/.config/nvim-new/lua/lsp.lua
vim.lsp.enable({
  "bashls",
  "gopls",
  "lua_ls",
})
vim.diagnostic.config({ virtual_text = true })
