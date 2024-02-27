vim.opt.colorcolumn = "10"

local config = {
    cmd = {'/usr/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'.gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    on_attach = function()
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>cd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "<leader>cD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "<leader>ct", function() vim.lsp.buf.type_definition() end, opts)
	--vim.keymap.set("n", "<leader>ci", function() vim.lsp.buf.implementation() end, opts)   done by telescope
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	--vim.keymap.set("n", "<leader>cR", function() vim.lsp.buf.references() end, opts)   done by telescope
	vim.keymap.set("n", "<leader>cn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end
}

require('jdtls').start_or_attach(config)
