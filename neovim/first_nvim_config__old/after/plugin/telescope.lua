local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.load_extension('fzf')
--vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
--vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--vim.keymap.set('n', '<leader>ps', function()
--	builtin.grep_string({ search = vim.fn.input("Grep > ") });
--end)
vim.keymap.set('n', '<leader>?', builtin.oldfiles)
vim.keymap.set('n', '<leader><space>', builtin.buffers)
--vim.keymap.set('n', '<leader>/', function()
--  -- You can pass additional configuration to telescope to change theme, layout, etc.
--  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--    winblend = 10,
--    previewer = false,
--  })
--end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>tf', builtin.find_files)
vim.keymap.set('n', '<leader>th', builtin.help_tags)
vim.keymap.set('n', '<leader>tc', builtin.commands)
vim.keymap.set('n', '<leader>tw', builtin.grep_string) -- search for current word
vim.keymap.set('n', '<leader>tgr', builtin.live_grep)
vim.keymap.set('n', '<leader>tgf', builtin.git_files)
vim.keymap.set('n', '<leader>tgc', builtin.git_commits)
vim.keymap.set('n', '<leader>tgbc', builtin.git_bcommits)
vim.keymap.set('n', '<leader>tr', builtin.resume)
vim.keymap.set('n', '<leader>cd', builtin.diagnostics)
vim.keymap.set('n', '<leader>cr', builtin.lsp_references)
vim.keymap.set('n', '<leader>ci', builtin.lsp_implementations)
