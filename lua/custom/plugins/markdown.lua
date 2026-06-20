local function gh(repo) return 'https://github.com/' .. repo end
do
  vim.pack.add {
    gh 'OXY2DEV/markview.nvim',
    gh 'saghen/blink.lib',
    gh 'saghen/blink.cmp',
  }
end
