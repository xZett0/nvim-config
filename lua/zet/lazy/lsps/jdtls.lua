
local j = {}

function j.setup(capabilities)
    print("JDTLS Loaded")
    local jd = require("lspconfig").jdtls
    local home = vim.fn.expand("~")
    local workspace_dir = home .. "/.local/share/nvim/mason/packages/jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

    jd.setup({
        capabilities = capabilities,
        cmd = {
            "jdtls",  -- mason installs this in PATH
            "-data", workspace_dir,
        },
        root_dir = require("lspconfig.util").root_pattern(
            ".git", "mvw", "gradlew", "pom.xml", "build.gradle"
        ),
        settings = {
            java = {
                signatureHelp = { enabled = true },
                completion = { favoriteStaticMembers = {} },
                contentProvider = { preferred = "fernflower" },
            }
        },
        init_options = {
            bundles = {},
        },
    })
end

return j

