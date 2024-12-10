-- Insert Mode Remaps:
vim.keymap.set({ 'i', 'c' }, 'jk', '<Esc>', { desc = 'Exit insert/cmd-line mode' })
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Beginning of line' })
-- Normal Mode Remaps:
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page Down Centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page Up Centered' })
vim.keymap.set('n', 'H', 'Hzz', { desc = 'Middle Page Centered' })
vim.keymap.set('n', 'G', 'Gzz', { desc = 'EOF Centered' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
-- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { desc = 'New Buffer' }) --Don't really find myself using this
vim.keymap.set('n', '<leader><tab>', '<cmd> bn <CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader><S-tab>', '<cmd> bp <CR>', { desc = 'Prev Buffer' })
vim.keymap.set('n', '<leader>x', '<cmd> bn <CR> <cmd> bd# <CR>', { desc = 'Delete Buffer' })
vim.keymap.set('n', '<leader>gt', '<cmd> Git commit % <CR>', { desc = 'Commit [T]his file' })
vim.keymap.set('n', '<leader>ga', '<cmd> Git commit .<CR>', { desc = 'Commit [A]ll files' })
vim.keymap.set('n', '<leader>gp', '<cmd> Git push <CR>', { desc = 'Git [P]ush' })
-- Visual Mode Remaps:
-- These are now handled by mini.move:
-- vim.keymap.set('v', '<leader>j', " :m '>+ 1 <CR>gv=gv", { desc = 'Move Up Through Lines' })
-- vim.keymap.set('v', '<leader>k', ':m-2<CR>gv=gv', { desc = 'Move Down Through Lines' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', '<Plug>(leap-forward)', { desc = 'Leap Forward' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>L', '<Plug>(leap-backward)', { desc = 'Leap Backward' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>lw', '<Plug>(leap-from-window)', { desc = 'Leap from Window' })

local lspconfig = require 'lspconfig'
lspconfig.gopls.setup {}

local format_sync_grp = vim.api.nvim_create_augroup('goimports', {})
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').goimports()
  end,
  group = format_sync_grp,
})

-- Plugins:
return {
  {
    'ggandor/leap.nvim',
  },
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'theprimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('harpoon'):setup()
    end,
    keys = {
      {
        '<leader>A',
        function()
          require('harpoon'):list():add()
        end,
        desc = 'harpoon file',
      },
      {
        '<leader>a',
        function()
          local harpoon = require 'harpoon'
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'harpoon quick menu',
      },
      {
        '<leader>1',
        function()
          require('harpoon'):list():select(1)
        end,
        desc = 'harpoon to file 1',
      },
      {
        '<leader>2',
        function()
          require('harpoon'):list():select(2)
        end,
        desc = 'harpoon to file 2',
      },
      {
        '<leader>3',
        function()
          require('harpoon'):list():select(3)
        end,
        desc = 'harpoon to file 3',
      },
      {
        '<leader>4',
        function()
          require('harpoon'):list():select(4)
        end,
        desc = 'harpoon to file 4',
      },
      {
        '<leader>5',
        function()
          require('harpoon'):list():select(5)
        end,
        desc = 'harpoon to file 5',
      },
      {
        '<leader><tab>',
        function()
          require('harpoon'):list():next()
        end,
        desc = 'next stored buffer',
      },
      {
        '<leader>,',
        function()
          require('harpoon'):list():prev()
        end,
        desc = 'next stored buffer',
      },
    },
  },
}
