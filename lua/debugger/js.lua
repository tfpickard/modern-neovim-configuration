local dap_utils = require("dap-utils")

require("dap-vscode-js").setup({
	debugger_cmd = { os.getenv("HOME") .. "/.local/share/nvim/mason/bin/js-debug-adapter" },
})

local function set_adapter(adapter)
	require("dap").adapters[adapter] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = {
				os.getenv("HOME")
					.. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
				"${port}",
			},
		},
	}
end
local adapters = { "pwa-node", "pwa-chrome" }
for _, adapter in ipairs(adapters) do
	set_adapter(adapter)
end

local node = {
	{
		name = "Launch project",
		type = "pwa-node",
		request = "launch",
		cwd = "${workspaceFolder}",
		runtimeExecutable = "pnpm",
		runtimeArgs = {
			"debug",
		},
	},
	{
		name = "Launch file",
		type = "pwa-node",
		request = "launch",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach",
		type = "pwa-node",
		request = "attach",
		processId = require("dap.utils").pick_process,
		cwd = "${workspaceFolder}",
	},
}

local browser = {
	{
		name = "Launch Chrome",
		type = "pwa-chrome",
		request = "launch",
		runtimeExecutable = "/usr/bin/google-chrome-stable",
		userDataDir = false,
		webRoot = "${workspaceFolder}",
	},
	{
		name = "attach chrome",
		type = "pwa-chrome",
		request = "attach",
		port = 9222,
		webRoot = "${workspaceFolder}",
	},
}

dap_utils.setup({
	typescript = function(run)
		if core.file.file_contains(core.file.root_path() .. "/package.json", "vue") then
			run(core.lua.list.merge(browser, node))
		else
			run(node)
		end
	end,
	javascript = function(run)
		if core.file.file_contains(core.file.root_path() .. "/package.json", "vue") then
			run(core.lua.list.merge(browser, node))
		else
			run(node)
		end
	end,
	javascriptreact = function(run)
		run(browser)
	end,
	typescriptreact = function(run)
		run(browser)
	end,
	vue = function(run)
		run(browser)
	end,
})
