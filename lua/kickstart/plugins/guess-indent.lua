local function gh(repo) return 'https://github.com/' .. repo end
do
  vim.pack.add {
    gh 'NMAC427/guess-indent.nvim' -- Detect tabstop and shiftwidth automatically
  }
end
