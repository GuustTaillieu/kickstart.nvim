return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local oil = require 'oil'

    oil.setup {
      columns = { 'icon' },
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['<C-Space>'] = { 'actions.select' },
        ['<C-l>'] = { 'actions.select' },
        ['<C-h>'] = { 'actions.parent' },
        ['<M-h>'] = { 'actions.select_split' },
        ['<C-c>'] = { 'actions.close', mode = 'n' },
        ['<Esc>'] = { 'actions.close', mode = 'n' },
      },
      view_options = {
        show_hidden = true,
      },
    }

    vim.keymap.set('n', '-', oil.toggle_float, { desc = 'Open parent directory' })
  end,
}
