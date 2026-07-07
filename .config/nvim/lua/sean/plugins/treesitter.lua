return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  config = function()
    require('nvim-treesitter').setup {
      prefer_git = true,
      ensure_install = {
        'go',
        'cpp',
        'python',
        'java',
        'json',
        'javascript',
        'typescript',
        'tsx',
        'yaml',
        'html',
        'css',
        'markdown',
        'markdown_inline',
        'svelte',
        'graphql',
        'bash',
        'lua',
        'vim',
        'query',
        'vimdoc',
        'c',
      },
    }

  end,
}
