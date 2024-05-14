vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = "NVIM"
vim.o.foldcolumn = "2"

if not vim.g.vscode then return {
  vim.cmd "colorscheme catppuccin-mocha",
} end
