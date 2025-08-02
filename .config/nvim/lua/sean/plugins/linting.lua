return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'

    -- Configure golangci-lint to use .golangci.yml if present
    lint.linters.golangcilint.args = {
      'run',
      '--out-format=json',
      '--path-prefix',
      function()
        return vim.fn.getcwd()
      end,
    }

    lint.linters_by_ft = {
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      svelte = { 'eslint_d' },
      python = { 'pylint' },
      go = { 'golangcilint' },
      ruby = { 'rubocop' },
    }

    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })

    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Auto-fix golangci-lint issues on save for Go files
    vim.api.nvim_create_autocmd('BufWritePost', {
      group = lint_augroup,
      pattern = '*.go',
      callback = function()
        local file_dir = vim.fn.expand('%:p:h')
        vim.fn.system('golangci-lint run --fix ' .. vim.fn.shellescape(file_dir))
      end,
    })

    vim.keymap.set('n', '<leader>f', function()
      lint.try_lint()
    end, { desc = 'Trigger linting for current file' })
  end,
}
