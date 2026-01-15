return {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    root_dir = vim.fs.root(0, { ".git", "package.json", "tsconfig.json" }) or vim.fn.getcwd(),
    settings = {
        typescript = {
            preferences = { importModuleSpecifierPreference = "relative" },
        },
        javascript = {
            preferences = { importModuleSpecifierPreference = "relative" },
        },
    },
}
