vim.g.mapleader = " "

-- lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'Move selected lines DOWN one line' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'Move selected lines UP one line' })

-- scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'Scroll DOWN half a page and center the cursor line' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'Scroll UP half a page and center the cursor line' })

-- searching
vim.keymap.set("n", "n", "nzzzv", { desc = 'Move to next search and center cursor line' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'Move to previous search and center cursor line' })

-- delete selected and paste
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = 'Delete and paste before the cursor' })

-- yanks: asbjornHaland
vim.keymap.set({ "n", "v" }, "y", [["+y]], { desc = 'Yanks text to the system clipboard' })
vim.keymap.set("n", "Y", [["+Y]], { desc = 'Yanks line to the system clipboard' })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = 'Delete text w/o yank' })

-- save (this must have rmagatti/auto-session installed)
vim.keymap.set("n", "<C-s>", ":SessionSave<CR>:w<CR>",
    { silent = true, noremap = true, desc = 'Write file and save session' })

-- items
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = 'Go to next location list item' })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = 'Go to previous location list item' })

-- search
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Search and replace (entire buffer)' })

-- make executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'Make current file executable' })

-- sourcing
vim.keymap.set("n", "<leader><leader>", ":so<CR>", { silent = true, desc = 'Write and source file' })

-- quit
vim.keymap.set("n", "<C-x>", ":SessionSave<CR>:wa<CR>:q<CR>", { silent = true, desc = 'Write all and quit' })

-- windows navigation
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true, desc = 'Move to window above' })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true, desc = 'Move to window below' })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = 'Move to window to the right' })
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = 'Move to window to the left' })
vim.keymap.set("n", "<C-q>", "<C-w>c", { noremap = true, silent = true, desc = 'Close current window' })

-- windows resizing
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { noremap = true, silent = true, desc = 'Increase window height' })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { noremap = true, silent = true, desc = 'Decrease window height' })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>",
    { noremap = true, silent = true, desc = 'Increase window width' })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>",
    { noremap = true, silent = true, desc = 'Decrease window width' })

-- disable Q
vim.keymap.set("n", "Q", "<nop>")
