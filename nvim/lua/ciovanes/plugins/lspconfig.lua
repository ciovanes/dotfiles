return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "folke/neodev.nvim", opts = {} },
    },
    config = function()
        local nvim_lsp = require("lspconfig")
        local mason_lspconfig = require("mason-lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local protocol = require("vim.lsp.protocol")

        local on_attach = function(client, bufnr)
            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = vim.api.nvim_create_augroup("Format", { clear = true }),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format()
                    end,
                })
            end
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()

        mason_lspconfig.setup_handlers({
            function(server)
                nvim_lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = on_attach,
                })
            end,
            ["pyright"] = function()
                nvim_lsp["pyright"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["clangd"] = function()
                nvim_lsp["clangd"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["bashls"] = function()
                nvim_lsp["bashls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["jdtls"] = function()
                nvim_lsp["jdtls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["kotlin_language_server"] = function()
                nvim_lsp["kotlin_language_server"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["lua_ls"] = function()
                nvim_lsp["lua_ls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["marksman"] = function()
                nvim_lsp["marksman"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
            ["sqlls"] = function()
                nvim_lsp["sqlls"].setup({
                    on_attach = on_attach,
                    capabilities = capabilities,
                })
            end,
        })
    end,
}

