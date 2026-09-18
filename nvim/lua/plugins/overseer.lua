vim.pack.add({
	'https://github.com/stevearc/overseer.nvim'
})

local overseer = require('overseer')
local mapn = require('utils').mapn

overseer.setup({
	output = {
		use_terminal = false,
	},
	task_list = {
		max_height = { 80, 0.5 }
	},
})

mapn('<leader>ot', '<cmd>OverseerToggle<cr>')

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local themes = require('telescope.themes')
local sessions_dir = vim.fn.stdpath('data') .. '/session'

local function get_tasks()
	local tasks = {}
	local cwd = vim.uv.cwd()
	local task_file = cwd .. '/.vscode/tasks.json'
	local file_content = vim.fn.readfile(task_file)
	local ok, data = pcall(vim.fn.json_decode, table.concat(file_content, '\n'))
	for _, task in ipairs(data.tasks) do
		if task.label and task.label ~= '' then
			table.insert(tasks, {
				label = task.label,
				task = task,
			})
		end
	end
	return tasks
end

mapn('<leader>or', function(opts)
	local tasks = get_tasks()

	opts = opts or {}
	pickers.new(themes.get_dropdown(opts), {
	prompt_title = 'Run Task',
	finder = finders.new_table({
		results = tasks,
		entry_maker = function(entry)
			return {
				value = entry,
				display = entry.label,
				ordinal = entry.label,
			}
		end,
	}),
	sorter = conf.generic_sorter(opts),
	attach_mappings = function(prompt_bufnr, map)
		local run = function()
			local selection = action_state.get_selected_entry()
			actions.close(prompt_bufnr)
			overseer.run_task({ name = selection.value.label})
		end
		map("n", "x", run)
		return true
	end,
	}):find()
end)
