local function gh(repo) return 'https://github.com/' .. repo end
do
  vim.pack.add { gh 'eero-lehtinen/oklch-color-picker.nvim' }
  require('oklch-color-picker').setup {}
end
