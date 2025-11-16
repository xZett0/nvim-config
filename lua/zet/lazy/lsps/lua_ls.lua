local lua_ls = {}

function lua_ls.setup(capabilities)
    require("lspconfig").lua_ls.setup {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
            }
        }
    }
end
