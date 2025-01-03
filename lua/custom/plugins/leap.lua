vim.keymap.set({ 'n', 'x', 'o', 'v' }, '<leader>l', '<Plug>(leap-forward)', { desc = 'Leap Forward' })
vim.keymap.set({ 'n', 'x', 'o', 'v' }, '<leader>L', '<Plug>(leap-backward)', { desc = 'Leap Backward' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>lw', '<Plug>(leap-from-window)', { desc = 'Leap from Window' })

return {
  'ggandor/leap.nvim',
}
