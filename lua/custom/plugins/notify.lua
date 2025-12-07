return {
  'rcarriga/nvim-notify',
  event = 'VeryLazy',
  config = function()
    local notify = require 'notify'
    notify.setup {
      merge_duplicates = true,
      background_colour = '#000000',
      render = 'default',
      timeout = 5000,
      stages = 'fade',
      icons = {
        ERROR = '',
        WARN = '',
        INFO = '',
        DEBUG = '',
        TRACE = '✎',
      },
    }
    vim.notify = notify
  end,
}
