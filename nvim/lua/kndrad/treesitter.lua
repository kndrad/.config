require('nvim-treesitter.configs').setup({
    -- A list of parser names, or "all"
    ensure_installed = {
        -- "go", "bash", "vimdoc", "javascript", "typescript", "c", "lua", "rust", "svelte", "terraform",
        -- "toml", "regex", "proto", "graphql", "html", "json", "python", "dockerfile", "vim"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    ignore_install = {},

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
})

-- Link the @parameter capture group to the custom highlight group for Go files
-- vim.api.nvim_set_hl(0, "@parameter.go", { fg = "#ffffff", link = "FunctionArgument" })
