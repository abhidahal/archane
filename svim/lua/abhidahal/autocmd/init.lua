require('abhidahal.autocmd.prettier')

local A = vim.api
local augroup = A.nvim_create_augroup
local autocmd = A.nvim_create_autocmd

SamratGroup = augroup("Samrat", {})
local yank_group = augroup("YankGroup", {})

-- Highlight region on yank
autocmd("TextYankPost", {
  group = yank_group,
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual" })
  end,
})

local function trim_trailing_whitespace()
  local pos = A.nvim_win_get_cursor(0)
  vim.cmd([[silent keepjumps keeppatterns %s/\s\+$//e]])
  A.nvim_win_set_cursor(0, pos)
end

local function trim_trailing_lines()
  local last_line = A.nvim_buf_line_count(0)
  local last_nonblank_line = vim.fn.prevnonblank(last_line)
  if last_line > 0 and last_nonblank_line ~= last_line then
    A.nvim_buf_set_lines(0, last_nonblank_line, -1, true, {})
  end
end

local trimWhiteSpace = function()
  if not vim.o.binary and vim.o.filetype ~= "diff" then
    trim_trailing_lines()
    trim_trailing_whitespace()
  end
end

autocmd("BufWritePre", {
  group = SamratGroup,
  pattern = "*",
  callback = trimWhiteSpace,
})
