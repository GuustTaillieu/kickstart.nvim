return {
  'ThePrimeagen/harpoon',
  cmd = 'Harpoon',
  keys = {
    {
      '<leader>hh',
      '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>',
      desc = 'Toggle Harpoon Quick Menu',
    },
    {
      '<leader>ha',
      '<cmd>lua require("harpoon.mark").add_file()<cr>',
      desc = 'Mark Current File',
    },
    {
      '<leader>hr',
      '<cmd>lua require("harpoon.mark").clear_file()<cr>',
      desc = 'Remove Current File',
    },
    {
      '<leader>hn',
      '<cmd>lua require("harpoon.ui").nav_next()<cr>',
      desc = 'Next Harpoon',
    },
    {
      '<leader>hp',
      '<cmd>lua require("harpoon.ui").nav_prev()<cr>',
      desc = 'Previous Harpoon',
    },
    {
      '<leader>h&',
      '<cmd>lua require("harpoon.ui").nav_file(1)<cr>',
      desc = 'Go to 1st Mark',
    },
    {
      '<leader>hé',
      '<cmd>lua require("harpoon.ui").nav_file(2)<cr>',
      desc = 'Go to 2nd Mark',
    },
    {
      '<leader>h"',
      '<cmd>lua require("harpoon.ui").nav_file(3)<cr>',
      desc = 'Go to 3rd Mark',
    },
    {
      "<leader>h'",
      '<cmd>lua require("harpoon.ui").nav_file(4)<cr>',
      desc = 'Go to 4th Mark',
    },
    {
      '<leader>h(',
      '<cmd>lua require("harpoon.ui").nav_file(5)<cr>',
      desc = 'Go to 5th Mark',
    },
    {
      '<leader>h§',
      '<cmd>lua require("harpoon.ui").nav_file(6)<cr>',
      desc = 'Go to 6th Mark',
    },
    {
      '<leader>hè',
      '<cmd>lua require("harpoon.ui").nav_file(7)<cr>',
      desc = 'Go to 7th Mark',
    },
    {
      '<leader>h!',
      '<cmd>lua require("harpoon.ui").nav_file(8)<cr>',
      desc = 'Go to 8th Mark',
    },
    {
      '<leader>hç',
      '<cmd>lua require("harpoon.ui").nav_file(9)<cr>',
      desc = 'Go to 9th Mark',
    },
  },
}
