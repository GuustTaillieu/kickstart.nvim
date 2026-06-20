-- autopairs
-- https://github.com/windwp/nvim-autopairs
local function gh(repo) return 'https://github.com/' .. repo end
do
    vim.pack.add { gh 'windwp/nvim-autopairs' }
    require('nvim-autopairs').setup {}
end
