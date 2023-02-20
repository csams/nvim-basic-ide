
local keymap = vim.keymap.set
local opts = { silent = true }

local function open_asciidoctor()
  if vim.fn.expand("%:e") ~= "adoc" then
    return
  end

  local full_doc_file = vim.fn.expand("%:p")
  local full_html_path = vim.fn.expand("%:p:r") .. ".html"
  local cmd = "asciidoctor " .. full_doc_file
  local err = vim._system(cmd)
  if vim.fn.filereadable(full_html_path) then
    vim._system("google-chrome-stable --new-window " .. full_html_path)
  else
    vim.notify(err)
  end
end

keymap("n", "<leader>ad", open_asciidoctor, opts)
