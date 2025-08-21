return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  cmd = { 'Trouble' },
  opts = {}, -- Use default options
  keys = {
    {
      '<leader>dt',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Toggle Diagnostics',
    },
    {
      '<leader>db',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Toggle Buffer Diagnostics',
    },
    {
      '<leader>qq',
      '<cmd>Trouble quickfix toggle<cr>',
      desc = 'Toggle Quickfix List',
    },
    {
      '<leader>ql',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Toggle Location List',
    },
    {
      '<leader>qc',
      '<cmd>:lua vim.fn.setqflist({}, "r")<cr>',
      desc = 'Clear Quickfix List',
    },
    {
      '<leader>qR',
      '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      desc = 'Toggle LSP References',
    },
  },
}
