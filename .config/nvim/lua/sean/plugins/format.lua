return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters = {
      ['golangci-lint'] = {
        command = 'golangci-lint',
        args = { 'run', '--fix' },
        cwd = function(self, ctx)
          local go_mod = vim.fs.find({ 'go.mod' }, { upward = true, path = ctx.filename })[1]
          if go_mod then
            return vim.fs.dirname(go_mod)
          end
          return nil
        end,
        stdin = false,
      },
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      go = { 'golangci-lint' },
      javascript = { { 'prettierd', 'prettier' } },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
    },
  },
}
