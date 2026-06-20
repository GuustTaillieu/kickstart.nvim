-- Add indentation guides even on blank lines

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help ibl`
local function gh(repo) return 'https://github.com/' .. repo end
vim.pack.add { gh 'lukas-reineke/indent-blankline.nvim' }
require('ibl').setup {}
