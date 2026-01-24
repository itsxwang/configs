-- ~/.config/nvim/lua/plugins/visual-multi.lua
return {
  {
    "mg979/vim-visual-multi",
    branch = "master",  -- or "test" if you want latest dev changes
    lazy = false,       -- load immediately (multi-cursor plugins benefit from eager loading)
    init = function()
      -- Optional customizations (defaults are usually fine)
      vim.g.VM_maps = {
        ["Find Under"]         = "<C-n>",       -- Ctrl+N to select word under cursor + next occurrences
        ["Find Subword Under"] = "<C-n>",
        ["Find Next"]          = "n",           -- n to add next match
        ["Find Prev"]          = "N",           -- N to add previous / go back
        ["Skip Region"]        = "q",           -- q to skip current match (very useful!)
        ["Remove Region"]      = "<C-x>",       -- remove a cursor
        ["Add Cursor Down"]    = "<C-Down>",
        ["Add Cursor Up"]      = "<C-Up>",
        ["Select All"]         = "<C-c>",       -- or whatever you prefer
        -- Exit / toggle modes
        ["Exit"]               = "<Esc>",
      }

      vim.g.VM_theme = 'iceblue'          -- or 'purplegray', 'codedark', 'ocean' etc.
      vim.g.VM_highlight_matches = 'underline'  -- or 'red' / 'blue' for visual feedback
    end,
  },
}
