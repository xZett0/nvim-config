return {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_dir = vim.fs.root(0, { ".git", ".luarc.json" }) or vim.fn.getcwd(),

    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "it", "describe", "before_each", "after_each" },
            },
        },
    },
}
