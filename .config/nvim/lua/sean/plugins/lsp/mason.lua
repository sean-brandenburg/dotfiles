return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require 'mason'
    local mason_lspconfig = require 'mason-lspconfig'
    local mason_tool_installer = require 'mason-tool-installer'

    -- enable mason and configure icons
    mason.setup {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    }

    mason_lspconfig.setup {
      -- list of lsp servers for mason to install
      ensure_installed = {
        'gopls',
        'jdtls',
        -- 'tsserver', -- Can't find this for some reason?
        'html',
        'cssls',
        'tailwindcss',
        'svelte',
        'lua_ls',
        'pyright',
      },
    }

    mason_tool_installer.setup {
      ensure_installed = {
        'prettier',
        'stylua',
        'isort',
        'black',
        'goimports-reviser',

        -- Linters
        'golangci-lint',
        'pylint',
        'eslint_d',
      },
    }
  end,
}
