
-- Configure diagnostics
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Setup diagnostic signs
local signs = { Error = '✘', Warn = '⚠', Hint = '💡', Info = 'ℹ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Configure lua_ls with Mason path
local mason_bin = vim.fn.expand('~/.local/share/nvim/mason/bin/')

vim.lsp.config('lua_ls', {
  cmd = { mason_bin .. 'lua-language-server' },
})

vim.lsp.enable('lua_ls')

-- Setup autocompletion on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})
