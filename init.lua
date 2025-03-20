vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

vim.opt.relativenumber = true
vim.opt.termguicolors = true

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  { import = "plugins" },
  { "neovim/nvim-lspconfig" },  -- Ensure lspconfig is included
}, lazy_config)


-- Nvim-Java
local lspconfig = require('lspconfig')

-- Configure jdtls with Lombok
local workspace_dir = os.getenv("HOME") .. "/path/to/your/workspace"  -- Change this to your actual workspace path

lspconfig.jdtls.setup {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms4g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-javaagent:' .. os.getenv("HOME") .. '/Coding/libs/lombok.jar',
        '-jar', os.getenv("HOME") .. '/Coding/libs/jdt/plugins/org.eclipse.equinox.launcher.jar',
        '-configuration', os.getenv("HOME") .. '/Coding/libs/jdt/config_linux',
        '-data', workspace_dir
    },
    -- Add any additional configuration options here
}

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("Nvdash")
	end,
})

vim.g.python3_host_prog="/usr/bin/python3"
