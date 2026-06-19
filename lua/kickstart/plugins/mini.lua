-- Collection of various small independent plugins/modules
return {
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.surround').setup()
    require('mini.move').setup()
    require('mini.pairs').setup()
    require('mini.bracketed').setup()
    require('mini.notify').setup {
      window = {
        winblend = 0,
      },
    }
    local MiniFiles = require 'mini.files'
    MiniFiles.setup {
      mappings = {
        go_out = '<C-h>',
        go_in = '<C-l>',
        go_in_plus = '<C-l>',
        synchronize = '<C-s>',
      },
      windows = {
        preview = true,
        width_preview = 100,
      },
    }

    local minifiles_toggle = function(dir)
      if not MiniFiles.close() then
        MiniFiles.open(dir)
      end
    end

    local open_file_in_minifiles = function()
      minifiles_toggle(vim.fn.expand '%:p')
    end

    local set_cwd = function()
      local path = (MiniFiles.get_fs_entry() or {}).path
      if path == nil then
        return vim.notify 'Cursor is not on valid entry'
      end
      vim.fn.chdir(vim.fs.dirname(path))
    end

    -- Yank in register full path of entry under cursor
    local yank_path = function()
      if MiniFiles.get_explorer_state().target_window ~= nil then
        local path = (MiniFiles.get_fs_entry() or {}).path
        if path == nil then
          return vim.notify 'Cursor is not on valid entry'
        end
        vim.fn.setreg(vim.v.register, path)
      end
    end

    vim.keymap.set('n', '<leader>re', minifiles_toggle, { desc = 'Open Explorer in root' })
    vim.keymap.set('n', '<leader>e', open_file_in_minifiles, { desc = 'Open Explorer in current file' })
    vim.keymap.set('n', '<leader>cwd', set_cwd, { desc = 'Set cwd' })
    vim.keymap.set('n', '<leader>yp', yank_path, { desc = 'Yank path' })
    vim.keymap.set('n', '<Enter>', MiniFiles.go_in, { desc = 'Open file' })

    local statusline = require 'mini.statusline'
    -- set use_icons to true if you have a Nerd Font
    statusline.setup { use_icons = vim.g.have_nerd_font }

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end,
}
