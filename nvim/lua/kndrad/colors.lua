vim.cmd('colorscheme gopkg_docs')

require('nvim-web-devicons').setup({
    override = {
        go = {
            icon = "󰟓",
        }
    }
})

require('mini.statusline').setup()
