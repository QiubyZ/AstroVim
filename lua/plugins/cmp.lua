return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp'
    },
  -- override the options table that is used in the require("cmp").setup() call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require("cmp")
    -- modify the sources part of the options table
    opts.sources = cmp.config.sources({
      { name = "nvim_lsp", priority = 1000 },
      { name = "lua", priority = 750 },
      { name = "buffer", priority = 500 },
       { name = "path", priority = 900 },
    })
    
    -- ==========================================================
    -- Konfigurasi mapping CMP autocomplete code
    -- ==========================================================
    opts.mapping = cmp.mapping.preset.insert({
      ['<PageUp>'] = cmp.mapping.scroll_docs(-4),
      ['<PageDown>'] = cmp.mapping.scroll_docs(4),

      ['<ScrollWheelDown>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<ScrollWheelUp>"]  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), --Aktifkan <Enter> untuk konfirmasi
      ['<C-y>'] = cmp.config.enable,   })

    cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
    ['<ScrollWheelDown>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),  
    ['<ScrollWheelUp>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), 
    ['<LeftMouse>'] = cmp.mapping.complete(),  
    ['<CR>'] = cmp.mapping.confirm({ select = true }),  
  }),
  sources = {
        { name = 'path' },
        { name = 'cmdline'},
      },
      matching = { disallow_symbol_nonprefix_matching = false }
    })
   return opts
  end,
  
}
