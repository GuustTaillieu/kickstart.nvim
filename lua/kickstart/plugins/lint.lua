-- Linting
local function gh(repo) return 'https://github.com/' .. repo end
do
  vim.pack.add { gh 'mfussenegger/nvim-lint' }

  local lint = require 'lint'
  lint.linters_by_ft = {
    markdown = { 'markdownlint' }, -- Make sure to install `markdownlint` via mason / npm
    dockerfile = { 'hadolint' },
    json = { 'jsonlint' },
    rst = { 'vale' },
    text = { 'vale' },
    javascript = { 'eslint' },
    javascripttreact = { 'eslint' },
    typescript = { 'eslint' },
    svelte = { 'eslint_d' },
    kotlin = { 'ktlint' },
    terraform = { 'tflint' },
    ruby = { "ruby" },
  }

  -- Create autocommand which carries out the actual linting
  -- on the specified events.
  local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = lint_augroup,
    callback = function()
      -- Only run the linter in buffers that you can modify in order to
      -- avoid superfluous noise, notably within the handy LSP pop-ups that
      -- describe the hovered symbol using Markdown.
      if vim.bo.modifiable then lint.try_lint() end
    end,
  })
end
