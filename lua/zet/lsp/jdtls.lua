local function get_jdtls_paths()
    if vim.fn.executable("jdtls") == 1 then
        return "jdtls"
    end
    -- Fallback for typical Mason path if 'jdtls' isn't in PATH yet
    local mason_registry = require("mason-registry")
    if mason_registry.is_installed("jdtls") then
        local pkg = mason_registry.get_package("jdtls")
        return pkg:get_install_path() .. "/bin/jdtls"
    end
    return "jdtls"
end

local workspace_dir = vim.fn.expand("~/.local/share/nvim/jdtls_workspaces/") ..
vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

return {
    cmd = { get_jdtls_paths(), "-data", workspace_dir },
    filetypes = { "java" },
    root_dir = vim.fs.root(0, { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }) or vim.fn.getcwd(),
    settings = {
        java = {
            signatureHelp = { enabled = true },
            completion = { enabled = true },
        },
    },
}
