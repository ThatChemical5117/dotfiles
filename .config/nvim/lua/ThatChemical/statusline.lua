-- === GIT BRANCH CODE === 

-- Get current git branch
local function GitBranch() 
	-- Create command and get output from command line
	local command = io.popen("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
	local commandResault = command:read("*a")
	command:close()

	-- return the resault of this operation
	return commandResault
end


-- format the git ouput for the status line
local function StatuslineGit()
	local branchName = GitBranch()
	local statuslineoutput

	if branchName:len() > 0 then
		statuslineoutput = ' '..branchName..' '
	else
		statuslineoutput = ' --- '
	end
		
	return statuslineoutput
end

-- bring the status line together
local function CreateStatusLine()
	return table.concat {
		"%#PmenuSel#",
		StatuslineGit(),
		"%#LineNr#",
		"%#CursorColumn#",
		" %f",
		"%m",
		"%=",
		" %y",
		" %{&fileencoding?&fileencoding:&encoding}",
		"[%{&fileformat}]",
		" %p%%",
		" %l:%c"
	}

end

-- implement the status line
vim.opt.statusline = CreateStatusLine()
