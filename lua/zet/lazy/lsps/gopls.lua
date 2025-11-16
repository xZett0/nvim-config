local go = {}

function go.setup(capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.gopls.setup {
        capabilities = capabilities,
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    nilness = true,
                },
                staticcheck = true,
            }
        }
    }
end
