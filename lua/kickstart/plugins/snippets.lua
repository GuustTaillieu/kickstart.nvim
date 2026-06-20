local function gh(repo) return 'https://github.com/' .. repo end
do
  vim.pack.add { { src = gh 'L3MON4D3/LuaSnip', version = vim.version.range '2.*' } }
  vim.pack.add { gh 'rafamadriz/friendly-snippets' }
  require('luasnip.loaders.from_vscode').lazy_load()
  local ls = require('luasnip')
  ls.setup {
    history = false,
    updateevents = 'TextChanged,TextChangedI',
  }

  for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/custom/snippets/*lua', true)) do
    loadfile(ft_path)()
  end

  vim.keymap.set({ 'i', 's' }, '<c-k>', function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  vim.keymap.set({ 'i', 's' }, '<c-j>', function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  vim.keymap.set({ 'i', 's' }, '<c-l>', function()
    if ls.jumpable(1) then
      ls.jump(1)
    end
  end, { silent = true })
end
