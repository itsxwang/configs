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
map("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover docs" })
map("n", "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format code" })

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


-- Insert mode word navigation
keymap('i', '<C-Left>',  '<C-o>b',  { noremap = true, silent = true })
keymap('i', '<C-Right>', '<C-o>e<Right>',  { noremap = true, silent = true })