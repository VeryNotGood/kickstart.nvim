-- Insert Mode Remaps:
vim.keymap.set({ 'i', 'c', 'v' }, 'jk', '<Esc>', { desc = 'Exit insert/cmd-line/visual mode' })
vim.keymap.set('i', '<C-b>', '<ESC>^i', { desc = 'Beginning of line' })
vim.keymap.set('i', '<C-e>', '<ESC>$a', { desc = 'End of line' })
-- Normal Mode Remaps:
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Page [D]own Centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Page [U]p Centered' })
vim.keymap.set('n', 'H', 'Hzz', { desc = 'Middle Page Centered' })
vim.keymap.set('n', 'G', 'Gzz', { desc = 'EOF Centered' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join Lines' })
-- vim.keymap.set('n', '<leader>b', '<cmd> enew <CR>', { desc = 'New Buffer' }) --Don't really find myself using this
vim.keymap.set('n', '<leader><tab>', '<cmd> bn <CR>', { desc = '[N]ext Buffer' })
vim.keymap.set('n', '<leader><S-tab>', '<cmd> bp <CR>', { desc = '[P]rev Buffer' })
vim.keymap.set('n', '<leader>x', '<cmd> bn <CR> <cmd> bd# <CR>', { desc = 'Delete/E[x]it Buffer' })
vim.keymap.set('n', '<leader>gt', '<cmd> Git commit % <CR>', { desc = 'Commit [T]his file' })
vim.keymap.set('n', '<leader>ga', '<cmd> Git commit .<CR>', { desc = 'Commit [A]ll files' })
vim.keymap.set('n', '<leader>gp', '<cmd> Git push <CR>', { desc = 'Git [P]ush' })
vim.keymap.set('n', '<leader>gi', '<cmd> GoImport <CR>', { desc = '[G]o [I]mport' })
vim.keymap.set('n', '""', '<cmd> Telescope neoclip <CR>', { desc = 'Telescope Registers' })
-- Visual Mode Remaps:
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>l', '<Plug>(leap-forward)', { desc = 'Leap Forward' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>L', '<Plug>(leap-backward)', { desc = 'Leap Backward' })
vim.keymap.set({ 'n', 'x', 'o' }, '<leader>lw', '<Plug>(leap-from-window)', { desc = 'Leap from Window' })

-- require('lspconfig').gopls.setup {}
--
-- local format_sync_grp = vim.api.nvim_create_augroup('goimports', {})
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = '*.go',
--   callback = function()
--     require('go.format').goimports()
--   end,
-- group = format_sync_grp,
-- })
--
-- Plugins:
return {
  {
    'AckslD/nvim-neoclip.lua',
    dependencies = {
      -- you'll need at least one of these
      { 'nvim-telescope/telescope.nvim' },
      -- {'ibhagwan/fzf-lua'},
    },
    config = function()
      require('neoclip').setup()
    end,
  },
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      -- calling `setup` is optional for customization
      require('fzf-lua').setup {}
    end,
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@diagnostic disable-next-line
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "fs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "fS", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "fr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "fR", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },
  -- {
  --   'ggandor/leap.nvim',
  -- },
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
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('harpoon'):setup()

      local conf = require('telescope.config').values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-e>', function()
        require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())
      end, { desc = 'Harpoon Files Quick Menu' })
      vim.keymap.set('n', '<leader>A', function()
        require('harpoon'):list():add()
      end, { desc = '[A]dd Harpoon File' })
      vim.keymap.set('n', '<leader>a', function()
        toggle_telescope(require('harpoon'):list())
      end, { desc = 'Telescope Harpoon Files' })

      vim.keymap.set('n', '<leader>1', function()
        require('harpoon'):list():select(1)
      end, { desc = 'Harpoon File [ 1 ]' })
      vim.keymap.set('n', '<leader>2', function()
        require('harpoon'):list():select(2)
      end, { desc = 'Harpoon File [ 2 ]' })
      vim.keymap.set('n', '<leader>3', function()
        require('harpoon'):list():select(3)
      end, { desc = 'Harpoon File [ 3 ]' })
      vim.keymap.set('n', '<leader>4', function()
        require('harpoon'):list():select(4)
      end, { desc = 'Harpoon File [ 4 ]' })
      vim.keymap.set('n', '<leader>5', function()
        require('harpoon'):list():select(5)
      end, { desc = 'Harpoon File [ 5 ]' })

      vim.keymap.set('n', '<leader>p', function()
        require('harpoon'):list():prev()
      end, { desc = 'Harpoon [P]revious Buffer' })
      vim.keymap.set('n', '<leader>n', function()
        require('harpoon'):list():next()
      end, { desc = 'Harpoon [N]ext Buffer' })
    end,
  },
}
