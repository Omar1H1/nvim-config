require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


-- Nvim DAP
map("n", "<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("n", "<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("n", "<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("n", "<Leader>dc>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("n", "<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
	"n",
	"<Leader>dd",
	"<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	{ desc = "Debugger set conditional breakpoint" }
)
map("n", "<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("n", "<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })

-- rustaceanvim
map("n", "<Leader>dt", "<cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = "Debugger testables" })

-- jdtls keymaps

map('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
map('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
map('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
map('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
map('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
map('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })


map("n", "<Leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "LSP Code Action" })
-- luaSnip


local ls = require("luasnip")

map({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
map({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
map({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

map({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})


local neotest = require("neotest")

map("n", "<leader>tt", function() neotest.run.run() end, { desc = "Run nearest test" })
map("n", "<leader>tT", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Run all tests in file" })
map("n", "<leader>to", function() neotest.output.open() end, { desc = "Show test output" })
map("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle test summary" })
map("n", "<leader>td", function() neotest.run.run({ strategy = "dap" }) end, { desc = "Debug test" })

vim.keymap.set("n", "<leader>mr", ":RenderMarkdown<CR>", { desc = "Render Markdown" })
vim.keymap.set("n", "<leader>md", ":DisableRenderMarkdown<CR>", { desc = "Disable Markdown Render" })

