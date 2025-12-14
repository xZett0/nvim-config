local jd = {}

function jd.setup(capabilities)
    local jdtls = require("lspconfig").jdtls

    local home = vim.fn.expand("~")
    local root_dir = require("lspconfig.util").root_pattern(
        "pom.xml", "build.gradle", ".git"
    )

    local workspace_dir = home .. "/.local/share/nvim/jdtls_workspaces/"
        .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    jdtls.setup({
        capabilities = capabilities,
        root_dir = root_dir,
        cmd = {
            "jdtls",
            "-data", workspace_dir,
        },
        settings = {
            java = {
                signatureHelp = { enabled = true },
                completion = { enabled = true },
            },
        },
    })
end

return jd
