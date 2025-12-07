return {
  'L3MON4D3/LuaSnip',
  event = 'VimEnter',
  version = '2.*',
  build = (function()
    -- Build Step is needed for regex support in snippets.
    -- This step is not supported in many windows environments.
    -- Remove the below condition to re-enable on windows.
    if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
      return
    end
    return 'make install_jsregexp'
  end)(),
  dependencies = {
    {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
      end,
    },
  },
  config = function()
    local ls = require 'luasnip'
    ls.config.set_config {
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
  end,
}
