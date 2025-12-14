local tailwind = {}

function tailwind.setup(capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.tailwindcss.setup({
        capabilities = capabilities,

        filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },

        settings = {
            tailwindCSS = {
                classAttributes = { "class", "className", "clsx", "cva" },
                validate = true,
                lint = {
                    cssConflict = "warning",
                    invalidApply = "error",
                    invalidScreen = "error",
                    invalidVariant = "error",
                    invalidConfigPath = "error",
                },
            },
        },
    })
end

return tailwind
