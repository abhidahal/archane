local Remap = require("abhidahal.keymap")
local nnoremap = Remap.nnoremap

local dap = require("dap")

nnoremap("<F5>", dap.continue)
nnoremap("<F2>", dap.step_into)
nnoremap("<F3>", dap.step_over)
nnoremap("<F4>", dap.step_out)
nnoremap("<leader>b", dap.toggle_breakpoint)
nnoremap("<leader>B", function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)
nnoremap("<leader>lp", function()
  dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
nnoremap("<leader>dr", dap.repl.open)

nnoremap("<leader>dgt", require("dap-go").debug_test, { silent = true })
