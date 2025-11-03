local jdtls = require('jdtls')
local mason_bin = vim.fn.expand('~/.local/share/nvim/mason/bin/')
local jdtls_install = vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls')

-- Get the data directory for jdtls
local home = os.getenv('HOME')
local workspace_dir = home .. '/.cache/jdtls-workspace'
vim.fn.mkdir(workspace_dir, 'p')

local config = {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=WARNING',
    '-Xms1g',
    '-Xmx2g',
    '-javaagent:' .. jdtls_install .. '/lombok.jar',
    '-jar', jdtls_install .. '/plugins/org.eclipse.equinox.launcher_1.7.100.v20251014-1222.jar',
    '-configuration', jdtls_install .. '/config_linux',
    '-data', workspace_dir,
  },

  filetypes = { 'java' },

  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = 'interactive',
        runtimes = {
          {
            name = 'JavaSE-25',
            path = home .. '/.sdkman/candidates/java/25-graal',
            default = true,
          },
          {
            name = 'JavaSE-24',
            path = home .. '/.sdkman/candidates/java/24.0.2-graal',
          },
        },
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
      completion = {
        enabled = true,
        favoriteStaticMembers = {},
      },
    },
  },

  init_options = {
    bundles = {},
    extendedClientCapabilities = {
      resolveAdditionalTextEditsSupport = true,
      classFileContentsSupport = true,
    },
  },
}

return config
