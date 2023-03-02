local status_ok, tk = pcall(require, "telekasten")
if not status_ok then
  return
end

tk.setup({
  home = "/home/csams/projects/zk",
})

-- Launch panel if nothing is typed after <leader>z
vim.keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>")

-- Most used functions
vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
vim.keymap.set("n", "<leader>zfd", "<cmd>Telekasten find_daily_notes<CR>")
vim.keymap.set("n", "<leader>zfw", "<cmd>Telekasten find_weekly_notes<CR>")
vim.keymap.set("n", "<leader>zm", "<cmd>Telekasten find_friends<CR>")
vim.keymap.set("n", "<leader>zs", "<cmd>Telekasten search_notes<CR>")
vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
vim.keymap.set("n", "<leader>zw", "<cmd>Telekasten goto_thisweek<CR>")
vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
vim.keymap.set("n", "<leader>zt", "<cmd>Telekasten show_tags<CR>")
vim.keymap.set("n", "<leader>zi", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("n", "<leader>zy", "<cmd>Telekasten yank_notelink<CR>")
vim.keymap.set("n", "<leader>zr", "<cmd>Telekasten rename_note<CR>")

-- Call insert link automatically when we start typing a link
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
