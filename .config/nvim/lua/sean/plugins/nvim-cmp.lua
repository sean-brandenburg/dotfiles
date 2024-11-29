return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    'hrsh7th/cmp-nvim-lsp',
    {
      'L3MON4D3/LuaSnip',
      -- follow latest release.
      version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = 'make install_jsregexp',
    },
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'rafamadriz/friendly-snippets', -- useful snippets
    'onsails/lspkind.nvim', -- vs-code like pictograms
  },
  config = function()
    local cmp = require 'cmp'

    local luasnip = require 'luasnip'

    local lspkind = require 'lspkind'

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup {
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<CR>'] = cmp.mapping.confirm { select = true },

        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<Tab>'] = cmp.mapping.select_next_item(),

        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
      },
      -- sources for autocompletion
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- snippets
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
      },

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format {
          maxwidth = 50,
          ellipsis_char = '...',
        },
      },
    }
  end,
}
