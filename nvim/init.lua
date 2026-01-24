-- =========================================================
-- leader keys (must be first)
-- =========================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- =========================================================
-- disable unused providers (faster startup)
-- =========================================================
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- =========================================================
vim.opt.number = true
vim.opt.relativenumber = true

-- case-insensitive search by default
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.mouse = "a"
vim.opt.termguicolors = true

-- =========================================================
-- transparent background / terminal colors
-- =========================================================
vim.cmd([[
  hi normal guibg=none
  hi normalnc guibg=none
  hi endofbuffer guibg=none
  hi linenr guibg=none
  hi signcolumn guibg=none
]])

-- =========================================================
-- clipboard (system clipboard by default)
-- =========================================================
vim.opt.clipboard = "unnamedplus"

-- explicit xclip provider (linux/x11)
if vim.fn.has("unix") == 1 and vim.fn.executable("xclip") == 1 then
    vim.g.clipboard = {
        name = "xclip",
        copy = {
            ["+"] = "xclip -selection clipboard",
            ["*"] = "xclip -selection primary"
        },
        paste = {
            ["+"] = "xclip -selection clipboard -o",
            ["*"] = "xclip -selection primary -o"
        },
        cache_enabled = true
    }

    -- reload clipboard provider
    vim.g.loaded_clipboard_provider = nil
    vim.cmd("runtime autoload/provider/clipboard.vim")
end

-- =========================================================
-- basic keymaps (essentials)
-- =========================================================
vim.keymap.set("n", "<leader>w", ":w<cr>", {
    desc = "save file"
})
vim.keymap.set("n", "<leader>q", ":q<cr>", {
    desc = "quit"
})
vim.keymap.set("n", "<leader>x", ":x<cr>", {
    desc = "save & quit"
})

-- fix common typos (:w, :q, etc.)
-- for _, c in ipairs({{"q", "q"}, {"w", "w"}, {"wq", "wq"}, {"wq", "wq"}, {"qa", "qa"}, {"qa", "qa"}}) do
   --  vim.api.nvim_create_user_command(c[1], c[2], {})
-- end

-- =========================================================
-- bootstrap lazy.nvim
-- =========================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
                   lazypath})
end

vim.opt.rtp:prepend(lazypath)

-- =========================================================
-- load plugins
-- =========================================================
require("lazy").setup("plugins", {
    rocks = {
        enabled = false
    }
})

-- =========================================================
-- load extra keymaps (modular)
-- =========================================================
require("keymaps")
