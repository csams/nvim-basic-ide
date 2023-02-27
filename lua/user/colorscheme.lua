
local status_ok, scheme = pcall(require, "tokyonight")
if not status_ok then
  return
end

scheme.setup({
  style = "night",

  on_highlights = function (hl, c)
    hl.Folded.bg = c.bg;
  end
})

status_ok, _ = pcall(vim.cmd.colorscheme, "tokyonight-night")
if not status_ok then
  return
end
