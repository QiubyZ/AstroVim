--if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
--Bermasalah
-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {"lua","vim","bash","c","html"},
    auto_install = true,
    --highlight = true,
    indent = {enable = true},
  },
}
