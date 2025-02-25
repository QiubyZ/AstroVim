return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    {"hrsh7th/cmp-nvim-lsp-signature-help"},
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/nvim-cmp" },
    {"hrsh7th/vim-vsnip"}, --VSCode(LSP)'s snippet feature in vim/nvim.
  },
  
  config = function()
    
    local cmp = require("cmp")
    
    cmp.setup({

      snippet = { 
        expand = function(args)
          require("luasnip").lsp_expand(args.body)          
        end,
      },
      completion = {
        keyword_length = 1,
      },

      window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(
          {
            border = "double",
            winhighlight = 'Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None',            
          }
        )
      },

      mapping = {
        ['<PageUp>'] = cmp.mapping.scroll_docs(-4),
        ['<PageDown>'] = cmp.mapping.scroll_docs(4),
        ['<Esc>'] = cmp.mapping.abort(),
        ['<ScrollWheelDown>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<ScrollWheelUp>"]  = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Right>"] = cmp.mapping.confirm({select = true}),
        ["<Left>"] = cmp.mapping.abort(), 
     },
      sources = cmp.config.sources({
      {name = "nvim_lsp", priority = 1000, keyword_length = 1},
      { name = "lua", priority = 750 },
      { name = "buffer", priority = 500},
        { name = 'nvim_lsp_signature_help' },
        {name = "path"},
        {name = "vsnip"},
      }),
      
      experimental = {
       ghost_text = true,
       },
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
        
      },
    })
    -- For `/` and `?`
    --
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline({
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<Down>"]  = cmp.mapping(cmp.mapping.select_next_item(),{ 'i', 'c' }),
        ['<ScrollWheelDown>'] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
        ["<ScrollWheelUp>"]  = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
      }),
      sources = cmp.config.sources({
        { name = "buffer" },}),
    })
    -- Configuate for Only cmdline
    --
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline({
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<Down>"]  = cmp.mapping(cmp.mapping.select_next_item(),{ 'i', 'c' }),
        ['<ScrollWheelDown>'] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
        ["<ScrollWheelUp>"]  = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
      }),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }, {
        { name = "buffer" },
      }),

    })
  end,
}
