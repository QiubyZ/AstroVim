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
    {"hrsh7th/cmp-emoji"},
    { "hrsh7th/nvim-cmp" },
    {'hrsh7th/vim-vsnip'},
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    
    
    cmp.setup({
      snippet = {
    --         expand = function(args)
    --   vim.fn["vsnip#anonymous"](args.body)
    -- end,
               
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
          
        end,
      },
      window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
        
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

        -- LuaSnip
        ["<C-j>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
            
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }, 
      sources = cmp.config.sources({
      
      {index= "1", name = "nvim_lsp", priority = 1000 },
      { name = "lua", priority = 750 },
      { name = "buffer", priority = 500 },
        { name = 'nvim_lsp_signature_help' },
        {name = "path"},
        { name = "emoji", priority = 700 },

      }),
      
      formatting = {
--        format = require("lspkind").cmp_format({
--          symbol_map = { Copilot = "" },
--        }),
      },
      experimental = {
       ghost_text = true,
       },
      -- -- Bump copilot suggestions down below better suggestions from other sources
      sorting = {
        priority_weight = 2,
        comparators = {
 --         require("copilot_cmp.comparators").prioritize,

          -- Below is the default comparator list and order for nvim-cmp
          cmp.config.compare.offset,
          -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
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
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline({
        ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ["<Down>"]  = cmp.mapping(cmp.mapping.select_next_item(),{ 'i', 'c' }),
        ['<ScrollWheelDown>'] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
        ["<ScrollWheelUp>"]  = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
      }),
      sources = cmp.config.sources({
        { name = "buffer" },
}),
    })

    -- Configuate for Only cmdline
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
