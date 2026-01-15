return {
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = vim.fs.root(0, { ".git", "pyproject.toml" }) or vim.fn.getcwd(),

    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "off",
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "openFilesOnly",
                reportAny = false,
                reportMissingTypeStubs = false,
                reportUnknownVariableType = false,
                reportUnknownMemberType = false,
                reportUnknownParameterType = false,
                reportUnknownArgumentType = false,
                reportUnknownLambdaType = false,
                reportMissingParameterType = false,
                reportMissingTypeArgument = false,
                reportUnusedCallResult = false,
                reportUnusedImport = false,
                reportUnusedVariable = false,
            },
        },
    },
}
