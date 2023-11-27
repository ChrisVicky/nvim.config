-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

-- ################################################
-- ##               LATEX   autocmd              ##
-- ################################################
-- Auto build latex when save the file
-- use make command `Makefile` to build `Latex Project`
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("texfilesave", { clear = true }),
  pattern = "*.tex",
  callback = function()
    vim.fn.jobstart({ "make" }, {
      stdout_buffered = false,
    })
  end,
})
