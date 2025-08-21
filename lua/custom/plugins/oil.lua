return {
  'stevearc/oil.nvim',
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local oil = require 'oil'

    oil.setup {
      -- default_file_explorer = true,
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,

      columns = { 'icon' },
      keymaps = {
        ['g?'] = { 'actions.show_help', mode = 'n' },
        ['gs'] = { 'actions.change_sort', mode = 'n' },
        ['<C-Space>'] = { 'actions.select' },
        ['<C-l>'] = { 'actions.select' },
        ['<C-h>'] = { 'actions.parent' },
        ['<C-c>'] = { 'actions.close', mode = 'n' },
        ['<Esc>'] = { 'actions.close', mode = 'n' },
        ['<M-v>'] = { 'actions.select', opts = { vertical = true } },
        ['<M-h>'] = { 'actions.select', opts = { horizontal = true } },
        ['<M-t>'] = { 'actions.select', opts = { tab = true } },
      },
      view_options = {
        show_hidden = true,
        natural_order = 'fast',
        is_always_hidden = function(name, _)
          return name == '..' or name == '.git'
        end,
      },
      win_options = {
        signcolumn = 'yes:2',
        wrap = true,
      },
      preview_win = {
        disable_preview = function(filename)
          return filename:match '^%.'
        end,
      },
      sort = {
        { 'name', 'asc' },
      },
      buf_options = {
        buflisted = false,
        bufhidden = 'delete', -- Delete the buffer immediately when hidden
      },
      cleanup_delay_ms = 0, -- Or set to false to disable auto-cleanup entirely if you prefer
    }

    vim.keymap.set('n', '-', oil.toggle_float, { desc = 'Open parent directory' })

    -- Always show preview
    vim.api.nvim_create_autocmd('User', {
      pattern = 'OilEnter',
      callback = vim.schedule_wrap(function(args)
        local oil = require 'oil'
        if vim.api.nvim_get_current_buf() == args.data.buf and oil.get_cursor_entry() then
          oil.open_preview()
        end
      end),
    })
  end,
}
