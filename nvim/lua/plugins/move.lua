-- lua/plugins/move.lua
return {
  {
    "echasnovski/mini.move",
    version = false,  -- latest from main branch
    config = function()
      require("mini.move").setup({
        -- Movements work in both Visual and Normal mode
        mappings = {
          -- Visual mode (selection) movements
          left   = "<S-h>",  -- Shift + H → move left (indent/outdent)
          right  = "<S-l>",  -- Shift + L → move right
          down   = "<S-j>",  -- Shift + J → move down
          up     = "<S-k>",  -- Shift + K → move up

          -- Normal mode (current line) movements
          line_left   = "<S-h>",
          line_right  = "<S-l>",
          line_down   = "<S-j>",
          line_up     = "<S-k>",
        },

        -- Re-indent when moving lines vertically (very useful)
        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
}
