local lua_lsp = {}

function lua_lsp.setup(capabilities)
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

return lua_lsp
