local ts = {}

function ts.setup(capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.ts_ls.setup({
        capabilities = capabilities,
        filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        settings = {
            typescript = {
                preferences = {
                    importModuleSpecifierPreference = "relative",
                },
            },
            javascript = {
                preferences = {
                    importModuleSpecifierPreference = "relative",
                },
            },
        },
    })
end

return ts
