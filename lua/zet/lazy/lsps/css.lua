local css = {}

function css.setup(capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.cssls.setup({
        capabilities = capabilities,
        settings = {
            css = { validate = true },
            scss = { validate = true },
            less = { validate = true },
        },
    })
end

return css
