-- vim.keymap.set("n", "<leader>f", vim.cmd.Ex) -- replaced by lf

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
--vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set({"n", "i"}, "<Up>", "<Nop>")
--vim.keymap.set({"n", "i"}, "<Down>", "<Nop>")
--vim.keymap.set({"n", "i"}, "<Left>", "<Nop>")
--vim.keymap.set({"n", "i"}, "<Right>", "<Nop>")

vim.keymap.set("n", "<leader>bb", "<C-w><C-p>")
vim.keymap.set("n", "<leader>bh", "<C-w><C-h>")
vim.keymap.set("n", "<leader>bl", "<C-w><C-l>")
vim.keymap.set("n", "<leader>bj", "<C-w><C-j>")
vim.keymap.set("n", "<leader>bk", "<C-w><C-k>")
vim.keymap.set("n", "<leader>bsh", "<cmd>split<CR>")
vim.keymap.set("n", "<leader>bsv", "<cmd>vsplit<CR>")
vim.keymap.set("n", "<leader>bd", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>bo", "<cmd>only<CR>")
vim.keymap.set("n", "<leader>b+", "<C-w>+")
vim.keymap.set("n", "<leader>b-", "<C-w>-")
vim.keymap.set("n", "<leader>b<", "<C-w><")
vim.keymap.set("n", "<leader>b>", "<C-w>>")
vim.keymap.set("n", "<leader>b=", "<C-w>=")

vim.keymap.set("n", "<leader>z", "<cmd>w<CR>")
