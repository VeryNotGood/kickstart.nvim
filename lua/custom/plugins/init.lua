-- Remap escapes
vim.keymap.set({ 'i', 'c' }, 'jk', '<Esc>', { desc = 'Exit insert/cmd-line' })
vim.keymap.set({ 'v' }, 'JK', '<Esc>', { desc = 'Exit visual mode' })
-- Insert mode line navigation
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<C-e>', '<ESC>$a', { desc = 'End of line' })
-- Normal Mode Remaps:
-- Vertical navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page [D]own Centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page [U]p Centered' })
vim.keymap.set('n', 'H', 'Hzz', { desc = 'Middle Page Centered' })
vim.keymap.set('n', 'G', 'Gzz', { desc = 'EOF Centered' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
-- Buffer navigation
vim.keymap.set('n', '<leader><tab>', '<cmd> bn <CR>', { desc = '[N]ext Buffer' })
vim.keymap.set('n', '<leader><S-tab>', '<cmd> bp <CR>', { desc = '[P]rev Buffer' })
vim.keymap.set('n', '<leader>df', '<cmd> bd <CR> <cmd> bn <CR>', { desc = '[D]elete/Exit Buffer' })
-- File navigation
vim.keymap.set('n', '<leader>e', '<cmd> lua MiniFiles.open() <CR>', { desc = '[D]elete/Exit Buffer' })
-- Git
vim.keymap.set('n', '<leader>gt', '<cmd> Git commit % <CR>', { desc = 'Commit [T]his file' })
vim.keymap.set('n', '<leader>ga', '<cmd> Git commit .<CR>', { desc = 'Commit [A]ll files' })
vim.keymap.set('n', '<leader>gp', '<cmd> Git push <CR>', { desc = 'Git [P]ush' })
-- Quick list
vim.api.nvim_set_keymap('n', '<M-j>', '<cmd>cnext<CR>', { desc = 'Quickfix List Down' })
vim.api.nvim_set_keymap('n', '<M-k>', '<cmd>cprev<CR>', { desc = 'Quickfix List Up' })

return {}
