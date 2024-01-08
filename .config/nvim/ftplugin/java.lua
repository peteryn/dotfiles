local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local config = {
    cmd = {
        'java',
	'-Declipse.application=org.eclipse.jdt.ls.core.id1',
	'-Dosgi.bundles.defaultStartLevel=4',
	'-Declipse.product=org.eclipse.jdt.ls.core.product',
	'-Dlog.level=ALL',
	'-Xmx1G',
	'--add-modules=ALL-SYSTEM',
	'--add-opens java.base/java.util=ALL-UNNAMED',
	'--add-opens java.base/java.lang=ALL-UNNAMED',
	'-jar', '/home/pyuan/jdt/plugins/org.eclipse.equinox.launcher_1.6.600.v20231106-1826.jar',
	'-configuration', '/home/pyuan/jdt/config_linux',
	'-data', vim.fn.expand('~/.cache/jdtls-workspace') .. workspace_dir,
    },
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    capabilities = capabilities,
    handlers = {
        ['language/status'] = function(_, result)
          -- Print or whatever.
        end,
        ['$/progress'] = function(_, result, ctx)
          -- disable progress updates.
        end,
    },
}
require('jdtls').start_or_attach(config)

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim. lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim. lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim. lsp.buf.signature_help()<CR>', opts)

