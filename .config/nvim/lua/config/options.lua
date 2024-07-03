-- this block sources a script I use to load Spanish accents shortcuts
local tildesVimPath = vim.fn.expand("$scripts/tildes.vim")
if tildesVimPath and vim.fn.filereadable(tildesVimPath) == 1 then
  vim.cmd("source " .. tildesVimPath)
end

vim.wo.relativenumber = true
vim.opt.wrap = true
vim.opt.scrolloff = 2
vim.opt.showcmd = true
