return {
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
}
