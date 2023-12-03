local trouble = require('trouble')

vim.keymap.set("n", "<leader>xx", function() trouble.toggle() end, { desc = 'Toggle Trouble' })
vim.keymap.set("n", "<leader>xw", function() trouble.toggle("workspace_diagnostics") end,
    { desc = 'Trouble Diagnostics (Workspace)' })
vim.keymap.set("n", "<leader>xd", function() trouble.toggle("document_diagnostics") end,
    { desc = 'Trouble Diagnostics (Document)' })
vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end, { desc = 'Trouble Quickfix' })
vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end, { desc = 'Trouble Location List Items' })
vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end, { desc = 'Trouble References from LSP' })


vim.diagnostic.config({
    virtual_text = true
})
