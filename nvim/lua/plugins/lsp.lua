return {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = {
        { "<leader>e", vim.diagnostic.open_float, desc="Open Diagnostic" },
        { "[d", vim.diagnostic.goto_prev, desc="Go to Previous Diagnostic" },
        { "]d", vim.diagnostic.goto_next, desc="Go to Next Diagnostic" },
        { "gD", vim.lsp.buf.declaration, desc="Go to Declaration" },
        { "gd", vim.lsp.buf.definition, desc="Go to Definition" },
        { "K", vim.lsp.buf.hover, desc="Hover" },
        { 'gi', vim.lsp.buf.implementation, desc="Go to Implementation" },
        { '<C-k>', vim.lsp.buf.signature_help, desc="Signature Help" },
        { '<leader>D', vim.lsp.buf.type_definition, desc="Get type definition" },
        { '<leader>rn', vim.lsp.buf.rename, desc="Rename" },
        { '<leader>ca', vim.lsp.buf.code_action, desc="Code Action" },
        { 'gr', vim.lsp.buf.references, desc="References" },
    },
    config = function()

        -- setup python lsp
        require('lspconfig')["pyright"].setup({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
        })

        -- setup c/c++ lsp
        require("lspconfig")["clangd"].setup({
            cmd = {
                -- see clangd --help-hidden
                "clangd",
                "--background-index",
                -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
                -- to add more checks, create .clang-tidy file in the root directory
                -- and add Checks key, see https://clang.llvm.org/extra/clang-tidy/
                "--clang-tidy",
                "--completion-style=bundled",
                "--cross-file-rename",
                "--header-insertion=iwyu",
            },
        })


        require("lspconfig")["arduino_language_server"].setup ({
            capabilities = require("cmp_nvim_lsp").default_capabilities(),
            cmd = {
                "arduino-language-server",
                "-clangd", "/usr/bin/clangd",
                "-cli", "/usr/bin/arduino-cli",
                "-cli-config", "/home/samuel/.arduino15/arduino-cli.yaml",
            },
        })


        require('lspconfig').gdscript.setup{
            flags = {
                debounce_text_changes = 150,
            }
        }

        -- setup lua lsp
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

    end
}
