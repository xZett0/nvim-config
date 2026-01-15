return {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = vim.fs.root(0, { ".git", "compile_commands.json", "compile_flags.txt" }) or vim.fn.getcwd(),
}
