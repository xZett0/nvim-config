return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- Note: require("lspconfig") is removed as per your new pattern guidelines
        local cmp = require('cmp')
        local cmp_lsp = require("cmp_nvim_lsp")
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")

        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require("fidget").setup({})
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls", "jdtls", "gopls", "basedpyright",
                "ts_ls", "html", "cssls", "clangd",
            },
            handlers = {
                function(server_name)
                    local opts = { capabilities = capabilities }

                    local require_ok, custom_opts = pcall(require, "zet.lazy.lsps." .. server_name)
                    if require_ok then
                        opts = vim.tbl_deep_extend("force", opts, custom_opts)
                    end

                    vim.lsp.config({
                        servers = {
                            [server_name] = opts
                        }
                    })

                    vim.lsp.enable(server_name)
                end,
            }
        })

        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            })
        })

        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
