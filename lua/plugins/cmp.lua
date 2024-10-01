return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdLineEnter" },
    dependencies = {
      'hrsh7th/cmp-cmdline',
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
      ['<C-y>'] = cmp.config.enable, 
      ['<LeftMouse>'] = cmp.mapping.confirm({ select = true }), --Aktifkan <LeftMouse> untuk konfirmasi
      test = cmp.mapping(function(fallback)
      if cmp.visible() then
        vim.notify("Detect")
        
      else
          vim.notify("Kaga")
      end
      fallback()
      end,{"i"}),
      
      
      --   ['<LeftMouse>'] = cmp.mapping(function(fallback)
      --     local entry = cmp.get_selected_entry()
      --     cmp.mapping.confirm({ select = true }) 
      --     if entry then 
      --       vim.inspect("Nete")
      --     
      --     else
      --       vim.inspect("Nete")
      --     -- vim.notify("Item yang diselect tidak ada")
      --       
      --       fallback()
      --        -- Jalankan fallback jika tidak ada item yang dipilih
      --     end
      --   end, { "i"}),
      -- 
    })
    

    cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    ['<ScrollWheelDown>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ["<ScrollWheelUp>"]  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      
    sources = cmp.config.sources({
      { name = 'path' },

    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })
    
    -- ==========================================================
    return opts
  end,
  
}
