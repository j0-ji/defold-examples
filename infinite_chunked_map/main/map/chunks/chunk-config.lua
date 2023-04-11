----------------------------------------------------------------------
-- CHUNK CONFIGURATION DATA
----------------------------------------------------------------------

local CC = {
	width = 16,
	height = 16,
	max_chunks = 25,
	tilesize = 16, -- size of tiles in px
	root_seed = os.clock() * 100000000000 , -- 123456789
}

CC.current_chunk = {
	x = 0,
	y = 0,
}

CC.chunksize = CC.width * CC.tilesize

CC.seed_mods = {
	trees = 65536,
}

CC.seeds = {
	trees = CC.root_seed + CC.seed_mods.trees,
}

return CC