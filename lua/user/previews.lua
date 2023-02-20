-- previews.lua uses asciidoctor and pandoc to generate html and open a browser


local keymap = vim.keymap.set
local opts = { silent = true }

local function asciidoctor()
  if vim.fn.expand("%:e") ~= "adoc" then
    return
  end

  local full_doc_file = vim.fn.expand("%:p")
  local full_html_path = vim.fn.expand("%:p:r") .. ".html"
  local cmd = "asciidoctor " .. full_doc_file
  local err = vim._system(cmd)

  if vim.fn.filereadable(full_html_path) then
    vim._system("open " .. full_html_path)
  else
    vim.notify(err)
  end
end

local function rst()
  if vim.fn.expand("%:e") ~= "rst" then
    return
  end

  local full_doc_file = vim.fn.expand("%:p")
  local full_html_path = vim.fn.expand("%:p:r") .. ".html"
  local cmd = "rst2html5.py " .. full_doc_file .. " " .. full_html_path
  local err = vim._system(cmd)

  if vim.fn.filereadable(full_html_path) then
    vim._system("open " .. full_html_path)
  else
    vim.notify(err)
  end
end

local function pandoc()
  local full_doc_file = vim.fn.expand("%:p")
  local full_html_path = vim.fn.expand("%:p:r") .. ".html"
  local cmd = "pandoc -t html " .. " -o " .. full_html_path .. " " .. full_doc_file
  local err = vim._system(cmd)

  if vim.fn.filereadable(full_html_path) then
    vim._system("open " .. full_html_path)
  else
    vim.notify(err)
  end
end

keymap("n", "<leader>pd", pandoc, opts)
keymap("n", "<leader>ad", asciidoctor, opts)
keymap("n", "<leader>md", pandoc, opts)
keymap("n", "<leader>rd", rst, opts)
