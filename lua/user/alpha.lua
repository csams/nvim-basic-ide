local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),

  dashboard.button("z", " " .. " Find Zettel", ":Telekasten find_notes<CR>"),
  dashboard.button("s", " " .. " Search Zettelkasten", ":lua require('telekasten').search_notes({default_text=''})<CR>"),
  dashboard.button("n", " " .. " New Zettel", ":Telekasten new_note<CR>"),
  dashboard.button("o", " " .. " New Zettel Template", ":Telekasten new_templated_note<CR>"),
  dashboard.button("d", " " .. " Today's Zettel", ":Telekasten goto_today<CR>"),
  dashboard.button("w", " " .. " This week's Zettel", ":Telekasten goto_thisweek<CR>"),
  dashboard.button("t", " " .. " Zettel Tags", ":Telekasten show_tags<CR>"),

  dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  dashboard.button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "cwsams@gmail.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
