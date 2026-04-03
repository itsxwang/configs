local map = vim.keymap.set

-- 📁 File (<leader>f)
map("n", "<leader>fs", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>fq", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>fQ", "<cmd>q!<CR>", { desc = "Force quit" })
map("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New file" })

-- 📦 Buffer (<leader>b)
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprev<CR>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- 🪟 Window (<leader>w)
map("n", "<leader>ws", "<cmd>split<CR>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>wc", "<cmd>close<CR>", { desc = "Close window" })
map("n", "<leader>wo", "<cmd>only<CR>", { desc = "Close other windows" })
map("n", "<leader>ww", "<C-w>w", { desc = "Next window" })

-- 🗂️ Tabs (<leader>t)
map("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Previous tab" })

-- ✂️ Clipboard
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from clipboard" })
map("n", "<leader>d", '"_d', { desc = "Delete without yank" })

-- 🧠 LSP (built-in)
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<A-h>", vim.lsp.buf.hover, { desc = "Hover docs" })
map("i", "<A-h>", vim.lsp.buf.hover, { desc = "Hover docs" })
map("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

-- format code
map("n", "<leader>fc", vim.lsp.buf.hover, { desc = "Format code" })

-- ✏️ `ci` placements with leader key
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Quotes
keymap("n", '<leader>"', 'ci"', opts)
keymap("n", "<leader>'", "ci'", opts)
keymap("n", "<leader>`", "ci`", opts)

-- Brackets
keymap("n", "<leader>(", "ci(", opts)
keymap("n", "<leader>)", "ci)", opts)
keymap("n", "<leader>{", "ci{", opts)
keymap("n", "<leader>}", "ci}", opts)
keymap("n", "<leader>[", "ci[", opts)
keymap("n", "<leader>]", "ci]", opts)
keymap("n", "<leader><", "ci<", opts)
keymap("n", "<leader>>", "ci>", opts)

-- format code
keymap("n", "<leader>fc", vim.lsp.buf.format)

-- copy down
keymap('n', 'Y', 'yyp', opts)
keymap("v", "Y", function()
  vim.api.nvim_feedkeys("y`>p", "n", false)
end, opts)

-- noh
keymap('n', '<A-x>', ':nohlsearch<CR>', opts)
keymap({'n', 'i'}, '<C-k>', vim.lsp.buf.hover, opts)

-- compile c code shortcut
keymap("n", "<leader>rc", function()
 vim.cmd("w")

  local file = vim.fn.expand("%")
  local output = vim.fn.expand("%:r")

  local cmd = string.format(
    "gcc %s -Wall -Wextra -std=gnu11 -o %s && ./%s",
    file,
    output,
    output
  )

  vim.cmd("botright split | terminal " .. cmd)
end, { silent = true })

-- comment 
keymap("n", "<C-_>", function()
  require("Comment.api").toggle.linewise.current()
end, { silent = true })

-- Single line toggle in Insert Mode
vim.keymap.set("i", "<C-_>", function()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local line_content = vim.api.nvim_get_current_line()

    -- 1. Toggle the comment
    require("Comment.api").toggle.linewise.current()

    -- 2. Handle cursor placement
    if line_content:match("^%s*$") then
        -- Move to end of line ($), then enter Insert Mode (a) 
        -- This naturally puts you one space after the //
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("$a", true, false, true), "n", true)
    else
        -- Restore exact position for lines with existing text
        vim.api.nvim_win_set_cursor(0, cursor_pos)
    end
end, { silent = true, desc = "Toggle comment with VSCode-style spacing" })

keymap("x", "<C-_>", "gcgv", { remap = true, silent = true })

keymap("n", "<C-A-a>", function()
  require("Comment.api").toggle.blockwise.current()
end, { silent = true })

keymap("v", "<C-A-a>", "gbgv", { remap = true })

-- Open TODO list (Telescope)
vim.keymap.set("n", "<leader>tt", "<cmd>TodoQuickFix<cr>", { silent = true })

-- Jump to next TODO
keymap("n", "]t", function()
  require("todo-comments").jump_next()
end, { silent = true })

-- Jump to previous TODO
keymap("n", "[t", function()
  require("todo-comments").jump_prev()
end, { silent = true })

-- select all 
keymap("n","<C-A>", "ggVG")

-- Insert mode word navigation
keymap('i', '<C-Left>',  '<C-o>b',  { noremap = true, silent = true })
keymap('i', '<C-Right>', '<C-o>e<Right>',  { noremap = true, silent = true })

-- go up in e, and cursor be on new uppermost line
keymap('i', '<C-k>', '<ESC>O', { noremap = true })

-- alt+d click for multi cursor
keymap("n", "<A-d>", "<Plug>(VM-Mouse-Cursor)", {})

-- Trigger / cycle Codeium suggestion (only when you want it)
