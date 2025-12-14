local p = {}

function p.setup(capabilities)
    print("Python LSP Loaded")

    require("lspconfig").basedpyright.setup({
        capabilities = capabilities,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic", -- or "strict"
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                }
            }
        }
    })
end

return p
