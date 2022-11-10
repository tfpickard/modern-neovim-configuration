local utils = require("utils")

utils.fn.require("lightspeed").setup({
	ignore_case = true,
	safe_labels = {
		"a",
		"b",
		"d",
		"e",
		"g",
		"h",
		"i",
		"j",
		"k",
		"l",
		"m",
		"n",
		"o",
		"p",
		"q",
		"r",
		"s",
		"u",
		"v",
		"w",
		"x",
		"y",
		"z",
		"A",
		"B",
		"D",
		"E",
		"G",
		"H",
		"I",
		"J",
		"K",
		"L",
		"M",
		"N",
		"O",
		"P",
		"Q",
		"R",
		"S",
		"U",
		"V",
		"W",
		"X",
		"Y",
		"Z",
	},
})

utils.fn.require("hop").setup({})

utils.fn.map("n", "s", "s", utils.var.opt)
utils.fn.map("n", "S", "S", utils.var.opt)
utils.fn.map("v", "s", "s", utils.var.opt)
utils.fn.map("v", "S", "S", utils.var.opt)
utils.fn.map("n", "f", "<Plug>Lightspeed_s", utils.var.opt)
utils.fn.map("n", "F", "<Plug>Lightspeed_S", utils.var.opt)
utils.fn.map("v", "f", "<Plug>Lightspeed_s", utils.var.opt)
utils.fn.map("v", "F", "<Plug>Lightspeed_S", utils.var.opt)
utils.fn.map("n", "c", "<Plug>Lightspeed_gs", utils.var.opt)
utils.fn.map("n", "C", "<Plug>Lightspeed_gS", utils.var.opt)
utils.fn.map("n", "L", "<cmd>HopLine<CR>", utils.var.opt)
utils.fn.map("v", "L", "<cmd>HopLine<CR>", utils.var.opt)
utils.fn.map("n", "e", "<cmd>HopChar1<CR>", utils.var.opt)
utils.fn.map("v", "e", "<cmd>HopChar1<CR>", utils.var.opt)
