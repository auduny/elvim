-- Unmapping
------------------------------------------------------------------
vim.api.nvim_set_keymap("n", "q:", "<Nop>", { noremap = true, silent = true })
------------------------------------------------------------------

-- Base Bindings
------------------------------------------------------------------
-- Yank & Paste
vim.opt.clipboard:prepend("unnamedplus")
vim.keymap.set("n", "<leader>YY", "<CMD>%y+<CR>", { desc = "Yank whole file to clipboard" })
vim.keymap.set("n", "<leader>y", '"+y', { desc = "Yank to clipboard", noremap = true })
vim.keymap.set("n", "<leader>p", '"0p', { desc = "Paste last yanked item under line", noremap = true })
vim.keymap.set("n", "<leader>P", '"0P', { desc = "Paste last yanked item above line", noremap = true })

-- Insert
vim.keymap.set("n", "<leader>i", "i<Space><ESC>i", { desc = "Enter insert mode with space in front", noremap = true })
------------------------------------------------------------------

-- Readline stuff
vim.api.nvim_set_keymap("i", "<C-a>", "<Home>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-e>", "<End>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<C-o>D", { noremap = true, silent = true })

-- Oil Bindings
------------------------------------------------------------------
local oil = require("oil")

vim.keymap.set("n", "<leader>o", oil.open, { desc = "Toggle Oil" })
------------------------------------------------------------------

-- LSP Bindings
------------------------------------------------------------------
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<C-t>", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
------------------------------------------------------------------

-- Diagnostics
------------------------------------------------------------------
vim.keymap.set("n", "ge", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message (Error message)" })
vim.keymap.set("n", "gE", vim.diagnostic.open_float, { desc = "Show diagnostic message" })
------------------------------------------------------------------

-- Remove highligts
------------------------------------------------------------------
vim.keymap.set("n", "<leader>rh", "<CMD>noh<CR>", { desc = "Stop highlighting words" })
------------------------------------------------------------------

-- Flash Bindings
------------------------------------------------------------------
local flash = require("flash")

vim.keymap.set({ "n", "x", "o" }, "s", flash.jump)
vim.keymap.set({ "n" }, "S", flash.treesitter)
vim.keymap.set({ "o" }, "r", flash.remote)
vim.keymap.set({ "o" }, "R", flash.treesitter_search)
vim.keymap.set({ "c" }, "<C-s>", flash.treesitter_search)
------------------------------------------------------------------

-- Harpoon Bindings
------------------------------------------------------------------
local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)
------------------------------------------------------------------

-- AI Stuff
------------------------------------------------------------------
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-q>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.keymap.set(
	{ "n", "x" },
	"<leader>gl",
	"<CMD>'<,'>CodeCompanion<CR>",
	{ desc = "Open Codecompanion", noremap = true }
)
vim.keymap.set("n", "<leader>gh", "<CMD>CodeCompanionChat<CR>", { desc = "Open Codecompanion" })
------------------------------------------------------------------

-- Treesitter Bindings

vim.keymap.set("n", "<leader>hi", ":Inspect<CR>", { desc = "Inspect Tree-sitter Highlight" })
vim.keymap.set("n", "<leader>ht", ":InspectTree<CR>", { desc = "Open Tree-sitter Tree View" })
