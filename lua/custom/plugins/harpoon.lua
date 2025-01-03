return {
  'ThePrimeagen/harpoon',
  branch = 'hareturnrpoon2',
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
}
