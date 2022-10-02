local utils = require("utils")
local ls = utils.fn.require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = utils.fn.require("luasnip.util.events")
local ai = utils.fn.require("luasnip.nodes.absolute_indexer")
local fmt = utils.fn.require("luasnip.extras.fmt").fmt
local m = utils.fn.require("luasnip.extras").m
local lambda = utils.fn.require("luasnip.extras").l
local postfix = utils.fn.require("luasnip.extras.postfix").postfix

local M = {
	s("vue", {
		t({ [[```vue]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("ts", {
		t({ [[```typescript]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
	s("sh", {
		t({ [[```sh]], "" }),
		i(1),
		t({ "", [[```]] }),
	}),
}

local todo = utils.fn.require("snippet/common/todo")
M = utils.fn.merge_table(todo, M)

return M
