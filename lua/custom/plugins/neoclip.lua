vim.keymap.set('n', '""', '<cmd> Telescope neoclip <CR>', { desc = 'Telescope Registers' })

return {
  'AckslD/nvim-neoclip.lua',
  dependencies = {
    -- you'll need at least one of these
    { 'nvim-telescope/telescope.nvim' },
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
}
