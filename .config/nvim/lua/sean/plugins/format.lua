return { -- Autoformat
  'stevearc/conform.nvim',
  lazy = false,
  keys = {
    {
      '<leader>f',
      function()
        -- For Go files, run golangci-lint --fix from project root
        if vim.bo.filetype == 'go' then
          local config_dir = vim.fs.find({ '.golangci.yml', '.golangci.yaml' }, { upward = true, path = vim.api.nvim_buf_get_name(0) })[1]
          if config_dir then
            local project_root = vim.fs.dirname(config_dir)
            vim.fn.system('cd ' .. vim.fn.shellescape(project_root) .. ' && golangci-lint run --fix')
            vim.cmd('edit!') -- Reload the buffer to show changes
          else
            require('conform').format { async = true, lsp_fallback = true }
          end
        else
          require('conform').format { async = true, lsp_fallback = true }
        end
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true, go = true }
      return {
        timeout_ms = 500,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
    },
  },
  config = function(_, opts)
    require('conform').setup(opts)
    
    -- Add autocmd for golangci-lint on Go file save
    vim.api.nvim_create_autocmd('BufWritePost', {
      pattern = '*.go',
      callback = function(args)
        local full_path = vim.fn.expand(args.match)
        local config_dir = vim.fs.find({ '.golangci.yml', '.golangci.yaml' }, { upward = true, path = full_path })[1]
        if config_dir then
          local project_root = vim.fs.dirname(config_dir)
          vim.fn.system('cd ' .. vim.fn.shellescape(project_root) .. ' && golangci-lint run --fix')
          vim.cmd('checktime')
        end
      end,
    })
  end,
}
