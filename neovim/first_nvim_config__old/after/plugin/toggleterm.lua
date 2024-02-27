local tt = require("toggleterm")

tt.setup({
	size = 3,
	open_mapping = [[<c-\>]],
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 1,
	start_in_insert = true,
	persist_size = true,
	direction = 'float',
	float_opts = {
		border = 'curved',
		winblend = 0,
		highlights =  {
			border = 'Normal',
			background = 'Normal'
		}
	}
})
