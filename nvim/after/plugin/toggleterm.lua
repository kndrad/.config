require('toggleterm').setup({
    direction = 'horizontal',
    size = 14,
    insert_mappings = true,
    open_mapping = [[<c-/>]],
    auto_scroll = true,
    on_close = function(term)
        vim.cmd("e")
    end,
})
