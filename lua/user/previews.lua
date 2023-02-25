-- previews.lua uses asciidoctor, rst2html5.py, or pandoc to generate html and
-- then opens a browser.

local keymap = vim.keymap.set
local opts = { silent = true }

local function get_files()
  local full_doc_file = vim.fn.expand("%:p")
  local full_html_path = vim.fn.expand("%:p:r") .. ".html"
  return full_doc_file, full_html_path
end

local function run(cmd, from, to)
  local output = ""
  if cmd ~= "" then
    output = vim.fn.system(cmd)
  end

  if output ~= "" then
    vim.notify(output)
  elseif vim.fn.filereadable(to) then
    output = vim.fn.system("open " .. to)
    if output ~= "" then
      vim.notify(output)
    end
  else
    vim.notify("Unable to render " .. from)
  end
end

local function asciidoctor()
  if vim.fn.expand("%:e") ~= "adoc" then
    return
  end

  local full_doc_file, full_html_path = get_files()
  local cmd = "asciidoctor " .. full_doc_file
  run(cmd, full_doc_file, full_html_path)
end

local function rst()
  if vim.fn.expand("%:e") ~= "rst" then
    return
  end

  local full_doc_file, full_html_path = get_files()
  local cmd = "rst2html5.py " .. full_doc_file .. " " .. full_html_path
  run(cmd, full_doc_file, full_html_path)
end

local function pandoc()
  local full_doc_file, full_html_path = get_files()
  local cmd = "pandoc -t html " .. " -o " .. full_html_path .. " " .. full_doc_file
  run(cmd, full_doc_file, full_html_path)
end

local function view()
  local path = vim.fn.expand("%:p")
  if vim.fn.filereadable(path) then
    local output = vim.fn.system("open " .. path)
    if output ~= "" then
      vim.notify(output)
    end
  end
end

keymap("n", "<leader>pd", pandoc, opts)
keymap("n", "<leader>ad", asciidoctor, opts)
keymap("n", "<leader>md", pandoc, opts)
keymap("n", "<leader>rd", rst, opts)
keymap("n", "<leader>v", view, opts)
