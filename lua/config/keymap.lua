-- Global keymaps configuration
-- All keymaps are organized by plugin/feature

-- Telescope keymaps
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Neo-tree keymaps
vim.keymap.set("n", "<C-n>", ":Neotree filesystem toggle left<CR>", { desc = "Neo-tree toggle filesystem" })
