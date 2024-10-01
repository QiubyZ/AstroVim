return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Optional dependencies
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
    {"stevearc/dressing.nvim", opts = {}}
  },
  config = function()
    require("codecompanion").setup{
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            url = string.format("https://generativelanguage.googleapis.com/v1beta/models/${model}:streamGenerateContent?alt=sse&key=${api_key}", model, api_key),
            env = {
            api_key = "AIzaSyAXCG2G5y6bMTlMwVyU7yvmprW1t_EF0Yc",
            model = "schema.model.default",
            },
            
            handlers = {
            chat_output = function(self, data)
    data = data:sub(7)
  end
  }
          })
        end
      },
       strategies = {
         chat = { adapter = "gemini" },
         inline = { adapter = "gemini" },
         completion = { adapter = "gemini" },
       },
    }
  end
}
