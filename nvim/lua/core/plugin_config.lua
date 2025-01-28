local plugin_config = {}

function plugin_config.setup()
  -- Colorscheme
  vim.cmd[[colorscheme tokyonight]]

  -- Treesitter configuration
  require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
  }

  -- Telescope configuration
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

  -- LSP configuration
  local lsp = require('lsp-zero').preset({})
  local cmp = require('cmp')
  
  -- Configure nvim-cmp
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { 'i', 's' }),
    }),
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'buffer' },
      { name = 'path' },
    },
  })

  lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
  end)
  require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
  lsp.setup()


  -- nvim-tree configuration
  require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })
  vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

  -- lualine configuration
  require('lualine').setup {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    }
  }

  -- nvim-autopairs configuration
  require('nvim-autopairs').setup{}

  -- gitsigns configuration
  require('gitsigns').setup()

  -- Comment.nvim configuration
  require('Comment').setup()

  -- bufferline configuration
  require("bufferline").setup{
    options = {
      separator_style = "slant",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      color_icons = true
    }
  }

end

return plugin_config


