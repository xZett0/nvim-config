local html = {}

function html.setup(capabilities)
    local lspconfig = require("lspconfig")

    lspconfig.html_ls.setup({
        capabilities = capabilities,
        filetypes = {
            "html",
            "javascriptreact",
            "typescriptreact",
        },
    })
end

return html
