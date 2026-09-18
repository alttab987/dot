vim.pack.add({
	'https://github.com/nvim-mini/mini.sessions',
})

local mapn = require('utils').mapn

require('mini.sessions').setup({
	autoread = false,
	autowrite = true,
})

mapn('<leader>sw', function()
	local input = vim.fn.input('Save session as: ')
	if input ~= '' then
		MiniSessions.write(input)
	end
end)

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local themes = require('telescope.themes')
local sessions_dir = vim.fn.stdpath('data') .. '/session'

local function get_sessions()
	local files = {}
	local handle = io.popen('ls -1 ' .. sessions_dir .. ' 2>/dev/null')
	if not handle then return files end
	for filename in handle:lines() do
		if filename ~= '' then
			table.insert(files, filename)
		end
	end
	handle:close()
	return files
end

mapn('<leader>ss', function(opts)
	local sessions = get_sessions()

	opts = opts or {}
	pickers.new(themes.get_dropdown(opts), {
	prompt_title = 'Read Session',
	finder = finders.new_table({
		results = sessions,
		entry_maker = function(entry)
			return {
				value = entry,
				display = entry,
				ordinal = entry,
			}
		end,
	}),
	sorter = conf.generic_sorter(opts),
	attach_mappings = function(prompt_bufnr, map)
		local read_session = function()
			local selection = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			MiniSessions.read(selection.value)
		end
		map("n", "e", read_session)
		return true
	end,
	}):find()
end)
