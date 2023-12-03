require('neodev').setup()

local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false, desc = '' }

    local function with_desc(desc)
        opts.desc = desc
        return opts
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, with_desc('Go to symbol definition'))
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, with_desc('Go to type definition'))
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, with_desc('List all symbol implementations'))
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, with_desc('Jump to declarion of symbol'))
    vim.keymap.set("n", "K", vim.lsp.buf.hover, with_desc('Hover info'))
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol,
        with_desc('View workspace symbols in quickfix window'))
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, with_desc('Go to next diagnostics'))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, with_desc('Go to previous diagnostics'))
    vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, with_desc('Code action'))
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, with_desc('View references of symbol'))
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, with_desc('Rename all refs of symbol'))
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, with_desc('Signature help'))
end)


lsp_zero.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 1000,
    },
    servers = {
        ['gopls'] = { 'go', 'gomod', 'gowork', 'gotmpl' },
        ['lua_ls'] = { 'lua' },
        -- ['rust_analyzer'] = { 'rust' },
        -- ['tsserver'] = { 'javascript', 'typescript' },
        -- ['ansiblels'] = { 'yaml.ansible' },
        ['bashls'] = { 'sh' },
        ['docker_compose_language_service'] = { 'yaml.docker-compose' },
        ['dockerls'] = { 'dockerfile' },
        ['graphql'] = { "graphql", "typescriptreact", "javascriptreact" },
        ['html'] = { 'html' },
        -- ['jsonls'] = { 'json', 'jsonc' },
        ['marksman'] = { 'markdown', 'markdown.mdx' },
        ['pylsp'] = { "python" },
    }
})

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'gopls', 'lua_ls', 'bashls', 'dockerls' },
    handlers = {
        lsp_zero.default_setup,
        gopls = function()
            require('lspconfig').gopls.setup({
                settings = {
                    staticheck = true,
                    gofumpt = true,
                    analyses = {
                        unusedparams = true,
                        unreachable = true,
                    }
                }
            })
        end,
    },
    automatic_installation = true,
})

-- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
-- --
-- require('go').setup({
--     lsp_cfg = {
--         capabilities = capabilities,
--     },
--     luasnip = false,
--     lsp_inaly_hints = { enable = false },
-- })
--
-- local cfg = require 'go.lsp'.config() -- config() return the go.nvim gopls setup
-- require('lspconfig').gopls.setup(cfg)


-- cmp settings
local cmp = require('cmp')
local cmp_action = lsp_zero.cmp_action()

-- require("luasnip.loaders.from_vscode").lazy_load()

--
cmp.setup({
    -- snippet = {
    --     expand = function(args)
    --         require('luasnip').lsp_expand(args.body)
    --     end
    -- },
    sources = {
        { name = 'path' },
        { name = 'nvim_lua' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    })
})
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'path' },
        { name = 'cmdline' },
        { name = 'nvim_lsp' },
    }
})
