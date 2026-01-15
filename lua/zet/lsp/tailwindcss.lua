return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "css", "scss", "javascript", "typescript", "javascriptreact", "typescriptreact" },
    root_dir = vim.fs.root(0, { ".git", "tailwind.config.js", "tailwind.config.ts" }) or vim.fn.getcwd(),
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
