vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>h", function () vim.cmd("noh") end)
vim.keymap.set('n', "<leader>t", function () vim.cmd("tabnew") end)
vim.keymap.set('n', "<Tab>ne<CR>",function () vim.cmd("tabnext") end)
vim.keymap.set('n', "<Tab>pr<CR>",function () vim.cmd("tabprevious") end)



vim.keymap.set('v', "J", ":m '>+1<CR>gv=gv")
vim.keymap.set('v', "K", ":m '<-2<CR>gv=gv")


