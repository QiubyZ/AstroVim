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
    local api_key = function ()
      return os.getenv("GEMINI_API_KEY")
    end
    require("codecompanion").setup{
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            
            url = "https://generativelanguage.googleapis.com",
            env = {
            api_key = api_key(),
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
