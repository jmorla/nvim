return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = {
                "java", "c", "lua", "vim", "vimdoc", "query",
                "markdown", "markdown_inline", "sql",
                "javascript", "typescript", "html", "xml", "json"
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true }
        }
    end,
}
