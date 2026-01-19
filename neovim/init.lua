-- leader key mapping
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- leader key mappings
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>")



-- some nvim editor configs
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.mouse = "a"

-- Inherit terminal background color
vim.o.termguicolors = true        -- Enable 24-bit RGB color support
vim.cmd('hi Normal guibg=NONE')   -- Make background transparent (respect terminal bg)
vim.cmd('hi NormalNC guibg=NONE') -- Also affects inactive windows
vim.cmd('hi EndOfBuffer guibg=NONE') -- Remove ~ symbols background color
vim.cmd('hi LineNr guibg=NONE')   -- Line numbers background
vim.cmd('hi SignColumn guibg=NONE') -- Sign column background

-- Basic leader mappings (Normal mode)
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save & quit" })

for _, c in ipairs{{'Q','q'},{'W','w'},{'Wq','wq'},{'WQ','wq'},{'Qa','qa'},{'QA','qa'}} do vim.api.nvim_create_user_command(c[1], c[2], {}) end

-- Use system clipboard permanently
vim.opt.clipboard = "unnamedplus"


-- Explicit xclip provider setup (optional, mostly handled by Neovim)
if vim.fn.has("unix") == 1 and vim.fn.executable("xclip") == 1 then
  vim.g.clipboard = {
    name = "xclip",
    copy = {
      ["+"] = "xclip -selection clipboard",
      ["*"] = "xclip -selection primary",
    },
    paste = {
      ["+"] = "xclip -selection clipboard -o",
      ["*"] = "xclip -selection primary -o",
    },
    cache_enabled = true,
  }
  -- Reload clipboard provider so settings take effect live
  vim.g.loaded_clipboard_provider = nil
  vim.cmd("runtime autoload/provider/clipboard.vim")
end

