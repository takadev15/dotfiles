local M = {}

local home = os.getenv("HOME")
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle", "settings.gradle" }
local root_dir = require('jdtls.setup').find_root(root_markers)
if root_dir == "" then
  return
end

local workspace_folder = "/home/takadev/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local extendedClientCapabilities = require("jdtls").extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
  cmd = {
    '/home/takadev/Repo/eclipse.jdt.ls/org.eclipse.jdt.ls.product/target/repository/bin/jdtls',
    '-configuration', '/home/takadev/.cache/jdtls',
    '-data', workspace_folder,
  },
  root_dir = root_dir,
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" },
      completion = {
        favoriteStaticMembers = {
          "org.hamcrest.MatcherAssert.assertThat",
          "org.hamcrest.Matchers.*",
          "org.hamcrest.CoreMatchers.*",
          "org.junit.jupiter.api.Assertions.*",
          "java.util.Objects.requireNonNull",
          "java.util.Objects.requireNonNullElse",
          "org.mockito.Mockito.*",
        },
        importOrder = {
          "java",
          "javax",
          "com",
          "org"
        },
        filteredTypes = {
          "com.sun.*",
          "io.micrometer.shaded.*",
          "java.awt.*",
          "jdk.*",
          "sun.*",
        },
      },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = {
          template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
        },
        hashCodeEquals = {
          useJava7Objects = true,
        },
        useBlocks = true,
      },
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-openjdk/",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk/",
          },
        },
      },
    },
  },
  init_options = {
    extendedClientCapabilities = extendedClientCapabilities,
  },
}


M.run = function(on_attach, capabilities)
  config.capabilities = capabilities
  config.on_attach = on_attach
  config.handlers = vim.lsp.handlers
  config.handlers["language/status"] = function() end
  require("jdtls").start_or_attach(config)
  require("jdtls").setup_dap { hotcodereplace = "auto" }
end


M.setup = function()
  vim.api.nvim_create_autocmd({ "FileType"}, {
    pattern = "java",
    callback = function()
      local utils = require "modules.lsp.utils"
      require("modules.lsp.servers.jdtls").run(utils.on_attach, utils.capabilities)
    end,
    desc = "Start java language server"
  })
end

return M

