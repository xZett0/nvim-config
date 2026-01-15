return {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html", "javascriptreact", "typescriptreact" },
    root_dir = vim.fs.root(0, { ".git", "package.json" }) or vim.fn.getcwd(),
}
