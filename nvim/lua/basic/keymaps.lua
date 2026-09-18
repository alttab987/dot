local utils = require('utils')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

utils.mapn('<leader>w', '<cmd>write<cr>')
utils.mapn('<leader>q', '<cmd>quit<cr>')
utils.mapn('<leader>Q', '<cmd>quitall<cr>')
utils.mapn('<leader>v', '<cmd>vsplit<cr>')
utils.mapn('<leader>r', '@a')

utils.mapi('<C-e>', '<cr>')

utils.mapc('<C-x>', '<cr>')
