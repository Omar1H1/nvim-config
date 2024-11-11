-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"


-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})


lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities= capabilities,
  filetypes ={"go", "gomod", "gowork", "gotmpl"},
}

lspconfig.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.tailwindcss.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

lspconfig.eslint.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})


lspconfig.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
