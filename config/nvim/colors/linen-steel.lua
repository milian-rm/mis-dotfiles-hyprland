vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.g.colors_name = "linen-steel"

local c = {
  none     = "NONE",
  fg       = "#f0ece4",
  bg       = "#161b22",
  ui_bg    = "#2e3440",
  comment  = "#4c566a",
  subtle   = "#c8c0b4",
  red      = "#c4738a",
  red_br   = "#e8929e",
  green    = "#6a9e82",
  green_br = "#88c4a0",
  yellow   = "#d4a843",
  gold_br  = "#f0c86a",
  blue     = "#5b8db8",
  blue_br  = "#7ab0d8",
  magenta  = "#9b7ec8",
  mauve_br = "#b99ee0",
  cyan     = "#7eb8c9",
  cyan_br  = "#9ed4e4",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

hi("Normal",        { fg=c.fg,      bg=c.none })
hi("NormalNC",      { fg=c.fg,      bg=c.none })
hi("NormalFloat",   { fg=c.fg,      bg=c.none })
hi("SignColumn",    { bg=c.none })
hi("EndOfBuffer",   { fg=c.comment, bg=c.none })
hi("CursorLine",    { bg=c.ui_bg })
hi("CursorLineNr",  { fg=c.cyan,    bold=true })
hi("LineNr",        { fg=c.comment })
hi("ColorColumn",   { bg=c.ui_bg })
hi("VertSplit",     { fg=c.comment })
hi("WinSeparator",  { fg=c.comment })
hi("Folded",        { fg=c.comment, bg=c.ui_bg })
hi("Comment",       { fg=c.comment, italic=true })
hi("Constant",      { fg=c.cyan })
hi("String",        { fg=c.green })
hi("Character",     { fg=c.green })
hi("Number",        { fg=c.gold_br })
hi("Boolean",       { fg=c.yellow })
hi("Float",         { fg=c.gold_br })
hi("Identifier",    { fg=c.fg })
hi("Function",      { fg=c.blue_br, bold=true })
hi("Statement",     { fg=c.magenta })
hi("Keyword",       { fg=c.magenta })
hi("Operator",      { fg=c.cyan })
hi("Type",          { fg=c.mauve_br })
hi("StorageClass",  { fg=c.magenta })
hi("Special",       { fg=c.cyan_br })
hi("PreProc",       { fg=c.red })
hi("Include",       { fg=c.blue })
hi("Error",         { fg=c.red_br,  bold=true })
hi("Todo",          { fg=c.yellow,  bold=true })
hi("Pmenu",         { fg=c.fg,      bg=c.ui_bg })
hi("PmenuSel",      { fg=c.bg,      bg=c.cyan })
hi("PmenuSbar",     { bg=c.ui_bg })
hi("PmenuThumb",    { bg=c.comment })
hi("TabLine",       { fg=c.comment, bg=c.ui_bg })
hi("TabLineSel",    { fg=c.fg,      bg=c.bg,    bold=true })
hi("TabLineFill",   { bg=c.ui_bg })
hi("StatusLine",    { fg=c.fg,      bg=c.ui_bg })
hi("StatusLineNC",  { fg=c.comment, bg=c.ui_bg })
hi("Search",        { fg=c.bg,      bg=c.yellow })
hi("IncSearch",     { fg=c.bg,      bg=c.gold_br })
hi("Visual",        { bg="#2a3f5c" })
hi("DiagnosticError", { fg=c.red })
hi("DiagnosticWarn",  { fg=c.yellow })
hi("DiagnosticInfo",  { fg=c.cyan })
hi("DiagnosticHint",  { fg=c.comment })
hi("DiffAdd",    { fg=c.green })
hi("DiffChange", { fg=c.yellow })
hi("DiffDelete", { fg=c.red })
hi("DiffText",   { fg=c.blue_br })

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal",      { fg="#f0ece4", bg="NONE" })
    vim.api.nvim_set_hl(0, "NormalNC",    { fg="#f0ece4", bg="NONE" })
    vim.api.nvim_set_hl(0, "NormalFloat", { fg="#f0ece4", bg="NONE" })
    vim.api.nvim_set_hl(0, "SignColumn",  { bg="NONE" })
    vim.api.nvim_set_hl(0, "EndOfBuffer", { fg="#4c566a", bg="NONE" })
  end
})
