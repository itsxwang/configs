return {
  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<A-w>",
          clear_suggestion = "<A-x>",
          accept_word = "<A-e>",
        },
        color = {
          suggestion_color = "#808080",
          cterm = 244,
        },
        disable_keymaps = false,
      })
    end,
  },
}
