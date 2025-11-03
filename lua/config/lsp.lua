
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

-- Setup Java with nvim-jdtls
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'java',
  callback = function(ev)
    local jdtls = require('jdtls')
    local jdtls_config_path = vim.fn.stdpath('config') .. '/lsp/jdtls.lua'
    local jdtls_config = dofile(jdtls_config_path)

    -- Set root_dir dynamically based on current file location
    jdtls_config.root_dir = vim.fs.root(0, { '.git', 'pom.xml', 'build.gradle', 'build.gradle.kts' })
      or vim.fn.getcwd()

    -- Start or attach to jdtls
    jdtls.start_or_attach(jdtls_config)
  end,
})

-- Setup autocompletion on LSP attach
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    -- LSP Navigation keybindings
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, noremap = true })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, noremap = true })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = ev.buf, noremap = true })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, noremap = true })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, noremap = true })

    if client:supports_method('textDocument/completion') then
      vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy' }
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      vim.keymap.set('i', '<C-Space>', function()
        vim.lsp.completion.get()
      end)
    end
  end,
})
