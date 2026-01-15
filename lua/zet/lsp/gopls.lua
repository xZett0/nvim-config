return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = vim.fs.root(0, { ".git", "go.mod", "go.work" }) or vim.fn.getcwd(),
    settings = {
        gopls = {
            analyses = { unusedparams = true, nilness = true },
            staticcheck = true,
        },
    },
}
