-- Formats current buffer when quiting insert mode
function FormatBufWithCursorRestore()
    local cursor_pos = vim.fn.winsaveview() -- save cursor position
    vim.lsp.buf.format()                    -- format buf

    vim.defer_fn(function()
        vim.fn.winrestview(cursor_pos) --restore cursor position
    end, 0)
end

vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd InsertLeave * lua FormatBufWithCursorRestore()
  augroup END
]])

-- vim.cmd([[ let g:goimports = 1]])

-- golang
-- local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--     pattern = "*.go",
--     callback = function()
--         require('go.format').goimport()
--     end,
--     group = format_sync_grp,
-- })
