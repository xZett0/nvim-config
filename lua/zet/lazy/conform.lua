return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = { "black" },
        },
        format_on_save = {
            timeout_ms = 3000,
                lsp_format = "fallback",
        },
    })
    end,
}
