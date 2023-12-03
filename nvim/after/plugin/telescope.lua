-- telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope project file' })
vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end,
    { desc = 'Telescope grep string' }
)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = 'Telescope help tags' })

local telescope = require('telescope')
telescope.setup({
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
    }
})

telescope.load_extension('fzf')
telescope.load_extension('file_browser')

vim.keymap.set('n', '<leader>pb', ':Telescope file_browser<CR>', { desc = 'Telescope browse project' })
vim.keymap.set('n', '<leader>bb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>',
    { desc = 'Telescope file browser (current buffer)' })
