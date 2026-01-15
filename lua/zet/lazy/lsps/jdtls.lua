local home = vim.fn.expand("~")
local root_pattern = require("lspconfig.util").root_pattern

-- Calculate workspace dir dynamically
local workspace_dir = home .. "/.local/share/nvim/jdtls_workspaces/"
    .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

return {
    -- We define root_dir here in the config table
    root_dir = root_pattern("pom.xml", "build.gradle", ".git"),

    cmd = {
        "jdtls",
        "-data",
        workspace_dir,
    },

    settings = {
        java = {
            signatureHelp = { enabled = true },
            completion = { enabled = true },
        },
    },
}
