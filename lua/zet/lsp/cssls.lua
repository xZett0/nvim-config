return {
    cmd = { "vscode-css-language-server", "--stdio" },
    filetypes = { "css", "scss", "less" },
    root_dir = vim.fs.root(0, { ".git", "package.json" }) or vim.fn.getcwd(),
    settings = {
        css = { validate = true },
        scss = { validate = true },
        less = { validate = true },
    },
}
