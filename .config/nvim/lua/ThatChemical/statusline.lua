-- Highlighting colors for LSP diagnostics on the status line
vim.api.nvim_set_hl(0, "LspDiagnosticsSignError", {fg = "#f38ba8", bg = "#181825"})
vim.api.nvim_set_hl(0, "LspDiagnosticsSignWarning", {fg = "#f9e2af", bg = "#181825"})
vim.api.nvim_set_hl(0, "LspDiagnosticsSignInformation", {fg ="#89dceb", bg = "#181825"})
vim.api.nvim_set_hl(0, "LspDiagnosticsSignHint", {fg = "#94e2d5", bg="#181825"})

vim.api.nvim_set_hl(0, "StatuslineAccent", {fg ="#0f1633", bg = "#36a3d9"})
vim.api.nvim_set_hl(0, "StatuslineInsertAccent", {fg = "#0f1633", bg = "#b8cc52"})
vim.api.nvim_set_hl(0, "StatuslineVisualAccent", {fg= "#0f1633", bg= "#ffee99"})
vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", {fg= "#0f1633", bg= "#f07178"})
vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", {fg= "#0f1633", bg= "#ae81ff"})
vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", {fg= "#0f1633", bg= "#ffffff"})

local modes = {
  ["n"] = "NORMAL",
  ["no"] = "NORMAL",
  ["v"] = "VISUAL",
  ["V"] = "VISUAL LINE",
  [""] = "VISUAL BLOCK",
  ["s"] = "SELECT",
  ["S"] = "SELECT LINE",
  [""] = "SELECT BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rv"] = "VISUAL REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "VIM EX",
  ["ce"] = "EX",
  ["r"] = "PROMPT",
  ["rm"] = "MOAR",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

local function mode()
  local current_mode = vim.api.nvim_get_mode().mode
  return string.format(" %s ", modes[current_mode]):upper()
end

local function update_mode_colors()
  local current_mode = vim.api.nvim_get_mode().mode
  local mode_color = "%#StatusLineAccent#"
  if current_mode == "n" then
      mode_color = "%#StatuslineAccent#"
  elseif current_mode == "i" or current_mode == "ic" then
      mode_color = "%#StatuslineInsertAccent#"
  elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
      mode_color = "%#StatuslineVisualAccent#"
  elseif current_mode == "R" then
      mode_color = "%#StatuslineReplaceAccent#"
  elseif current_mode == "c" then
      mode_color = "%#StatuslineCmdLineAccent#"
  elseif current_mode == "t" then
      mode_color = "%#StatuslineTerminalAccent#"
  end
  return mode_color
end


local function GitBranch()
	local command = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	local commandResault = command:read("*a")

	command:close()

	return commandResault
end

local function StatuslineGit()

	local branchName = GitBranch()
	local statuslineoutput

	if branchName:len() > 0 then
		statuslineoutput = string.format("%s ", branchName)
	else
		statuslineoutput = ''  
	end

	return statuslineoutput
end

local function filepath()
  local fpath = vim.fn.fnamemodify(vim.fn.expand "%", ":~:.:h")
  if fpath == "" or fpath == "." then
      return " "
  end

  return string.format(" %%<%s/", fpath)
end

local function filename()
  local fname = vim.fn.expand "%:t"
  if fname == "" then
      return ""
  end
  return fname .. " "
end

local function lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %p%% %l:%c "
end

local function lsp()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""

  if count["errors"] ~= 0 then
    errors = " %#LspDiagnosticsSignError# " .. count["errors"]
  end
  if count["warnings"] ~= 0 then
    warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
  end
  if count["hints"] ~= 0 then
    hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
  end
  if count["info"] ~= 0 then
    info = " %#LspDiagnosticsSignInformation# " .. count["info"]
  end

  return errors .. warnings .. hints .. info .. "%#LineNr#%#CursorColumn#"
end

Statusline = {}

Statusline.active = function()
  return table.concat {
	update_mode_colors(),
	mode(),
	"%#LineNr#",
	"%#CursorColumn#",
	filepath(),	
	filename(),
	"%m",
    lsp(),
	"%=",
	StatuslineGit(),
	"%#LineNr#",
	"%#CursorColumn#",
	" %y",
	" %{&fileencoding?&fileencoding:&encoding}",
	"[%{&fileformat}]",
	lineinfo(),
  }
	
end

function Statusline.inactive()
	return table.concat{
		"%#LineNr#",
		filepath(),
		filename(),
		"%m",
		"%=",
		StatuslineGit(),
		" %y",
		" %{&fileencoding?&fileencoding:&encoding}",
		"[%{&fileformat}]",
	}
end

function Statusline.short()
  return "%f"
end

vim.api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
