vim.api.nvim_set_keymap('n', '<M-C-j>', ':Treewalker Down<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-C-k>', ':Treewalker Up<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-C-h>', ':Treewalker Left<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<M-C-l>', ':Treewalker Right<CR>', { noremap = true })

return {
  'aaronik/treewalker.nvim',
  opts = {
    highlight = true, -- briefly highlight the node after jumping to it
  },
}
