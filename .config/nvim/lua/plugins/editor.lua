require('util.lazy_file').lazy_file()

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim'
    },
    lazy = false,
    config = function ()
      require('neo-tree').setup({
          close_if_last_window = false,
          popup_border_style = "NC",
          enable_git_status = true,
          enable_diagnostics = true,
          open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
          open_files_using_relative_paths = false,
          short_case_insensitive = false,
          window = {
            position = 'right',
            mapping_options = {
              noremap = true,
              nowait = true,
            }
          },
          filesystem = {
            filtered_items = {
              visible = false,
              hide_dotfiles = false,
              hide_gitignore = false,
              hide_hidden = false,
              hide_by_name = {},
              hide_by_pattern = {},
              always_show = {},
              always_show_by_pattern = {},
              never_show = {},
              never_show_by_pattern = {}
            },
            group_empty_dirs = false,
          }
        })
      vim.keymap.set('n', '<C-o>', '<Cmd>Neotree toggle<CR>')
    end
  },
  {
    'alexghergh/nvim-tmux-navigation',
    config = function()
      local nav = require('nvim-tmux-navigation')

      nav.setup({
          disable_when_zoomed = true
        })

      vim.keymap.set('n', '<C-h>', nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', '<C-j>', nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', '<C-k>', nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', '<C-l>', nav.NvimTmuxNavigateRight)
    end
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts_extend = { 'spec' },
    opts = {
      preset = 'modern',
      defaults = {},
      spec = {
        {
          mode = {'n','v'},
          { '<leader>f', group = 'file/find' },
          { '<leader>ff', group = 'file/find', desc = 'Find files' },
          { '<leader>fg', group = 'file/find', desc = 'Find files (grep)' },
          { '<leader>s', group = 'surround' }
        }
      }
    },
    keys = {
      {
        '<leader>?',
        function ()
          require('which-key').show({ global = false })
        end,
        desc = "Buffer local keymaps"
      }
    },
    config = function (_, opts)
      local wk = require('which-key')
      wk.setup(opts)
    end
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    opts = {
      mappings = {
        add = '<leader>sa',
        delete = '<leader>sd',
        replace = '<leader>sr',
      }
    }
  },
  {
    'echasnovski/mini.pairs',
    version = '*',
    event = 'VeryLazy',
    opts = {
      modes = { insert = true, command = true, terminal = false },
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      skip_ts = { 'string' },
      skip_unbalanced = true,
      markdown = true
    },
    config = function (_, opts)
      require('mini.pairs').setup(opts)
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'LazyFile'
  }
}
