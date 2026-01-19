return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")

      wk.setup()

      -- Leader group names
      wk.add({
  { "<leader>f", group = "File" },
  { "<leader>b", group = "Buffer" },
  { "<leader>w", group = "Window" },
  { "<leader>t", group = "Tab / Toggle" },
  { "<leader>l", group = "LSP" },
  { "<leader>g", group = "Git" },
  { "<leader>s", group = "Search" },
})
    end,
  },
}
