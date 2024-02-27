local lf = require("lf")

lf.setup({
                  escape_quit = true,
                  border = "rounded"
		 })

vim.keymap.set("n", "<leader>f", "<cmd>Lf<CR>")
