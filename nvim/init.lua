-- =========================================================
-- LEADER KEYS (MUST BE FIRST)
-- =========================================================
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- =========================================================
-- DISABLE UNUSED PROVIDERS (FASTER STARTUP)
-- =========================================================
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- =========================================================
-- BASIC NVIM EDITOR SETTINGS (from old init.lua)
-- =========================================================
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.termguicolors = true

-- =========================================================
-- TRANSPARENT BACKGROUND / TERMINAL COLORS
-- =========================================================
vim.cmd([[
  hi Normal guibg=NONE
  hi NormalNC guibg=NONE
  hi EndOfBuffer guibg=NONE
  hi LineNr guibg=NONE
  hi SignColumn guibg=NONE
]])

-- =========================================================
-- CLIPBOARD (SYSTEM CLIPBOARD BY DEFAULT)
-- =========================================================
vim.opt.clipboard = "unnamedplus"

-- Explicit xclip provider (Linux/X11)
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

  -- Reload clipboard provider
  vim.g.loaded_clipboard_provider = nil
  vim.cmd("runtime autoload/provider/clipboard.vim")
end

-- =========================================================
-- BASIC KEYMAPS (ESSENTIALS)
-- =========================================================
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save & quit" })

-- Fix common typos (:W, :Q, etc.)
for _, c in ipairs({
  { "Q", "q" },
  { "W", "w" },
  { "Wq", "wq" },
  { "WQ", "wq" },
  { "Qa", "qa" },
  { "QA", "qa" },
}) do
  vim.api.nvim_create_user_command(c[1], c[2], {})
end

-- =========================================================
-- BOOTSTRAP lazy.nvim
-- =========================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- =========================================================
-- LOAD PLUGINS
-- =========================================================
require("lazy").setup("plugins", {
  rocks = {
    enabled = false,
  },
})

-- =========================================================
-- LOAD EXTRA KEYMAPS (modular)
-- =========================================================
require("keymaps")
