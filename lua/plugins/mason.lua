--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason plugins

---@type LazySpec
return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = {
      ensure_installed = {
        -- "lemminx", --XML LSP
        "lua_ls", --Lua LSP
        "pyright", --Python LSP
        "gopls", -- Golang LSP
        "jdtls", --Java LSP
        "yamlls", --YML LSP
        "kotlin_language_server", --Kotlin LSP
        "bashls", --Bash LSP
        "gradle_ls", --Gradle LSP
        
        -- add more arguments for adding more language servers
      },
    },
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = {
      ensure_installed = {
        --"stylua",
        -- add more arguments for adding more null-ls sources
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = {
      ensure_installed = {
        "debugpy",
        "bash_debug_adapter",
        "go_debug_adapter",
        "kotlin_debug_adapter",
        "java_debug_adapter",
        -- add more arguments for adding more debuggers
      },
    },
  },
}
