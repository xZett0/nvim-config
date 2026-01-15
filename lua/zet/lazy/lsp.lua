return {
    "neovim/nvim-lspconfig", -- Kept only for internal types/utils if needed, but not used for setup
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
        vim.notify("🚀 LSP: Starting...", vim.log.levels.INFO)

        require("fidget").setup({})
        require("mason").setup()

        -- Use mason-lspconfig ONLY to ensure binaries are installed
        require("mason-lspconfig").setup({
            ensure_installed = {
                "basedpyright", "lua_ls", "clangd", "cssls",
                "html", "jdtls", "gopls", "tailwindcss", "ts_ls"
            }
        })

        -- Standard Capabilities for nvim-cmp
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            require("cmp_nvim_lsp").default_capabilities()
        )

        local installed_servers = require("mason-lspconfig").get_installed_servers()

        for _, server_name in ipairs(installed_servers) do
            local module_path = "zet.lsp." .. server_name
            package.loaded[module_path] = nil

            local ok, config = pcall(require, module_path)

            if ok then
                config.capabilities = vim.tbl_deep_extend("force", config.capabilities or {}, capabilities)

                vim.lsp.config[server_name] = config
                vim.lsp.enable(server_name)
            end
        end

        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' } })
        })

        vim.diagnostic.config({
            float = { focusable = false, style = "minimal", border = "rounded", source = "always", header = "", prefix = "" },
        })
    end
}
