local mason_bin = vim.fn.expand('~/.local/share/nvim/mason/bin/')
local jdtls_install = vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls')

-- Get the data directory for jdtls
local home = os.getenv('HOME')
local workspace_dir = home .. '/.cache/jdtls-workspace'
vim.fn.mkdir(workspace_dir, 'p')

return {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '-Xmx2g',
    '-javaagent:' .. jdtls_install .. '/lombok.jar',
    '-jar', jdtls_install .. '/plugins/org.eclipse.equinox.launcher_1.7.100.v20251014-1222.jar',
    '-configuration', jdtls_install .. '/config_linux',
    '-data', workspace_dir,
  },

  filetypes = { 'java' },

  root_markers = { '.git', 'pom.xml', 'build.gradle', 'build.gradle.kts' },

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {},
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
      },
    },
  },

  init_options = {
    bundles = {},
  },
}
