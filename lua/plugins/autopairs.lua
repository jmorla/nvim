return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string", "comment" }, -- don't add pairs in lua strings or comments
        javascript = { "string", "template_string" },
        java = { "string", "comment" }, -- don't add pairs in java strings or comments
      },
    })

    -- integration with nvim-cmp if you use it
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
  dependencies = {
    "hrsh7th/nvim-cmp", -- if you use completion
  },
}
