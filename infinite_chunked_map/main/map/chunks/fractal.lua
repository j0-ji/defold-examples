----------------------------------------------------------------------
-- FUNCTIONALITY
----------------------------------------------------------------------

-- module for creating fractal noise from simplex noise using
-- the simplex module. Furthermore the map and util modules are
-- used. First one for map properties, second one for creating
-- the grid-table

----------------------------------------------------------------------
-- DEPENDENCIES
----------------------------------------------------------------------

local simplex = require 'main.map.chunks.simplex'
local CC = require 'main.map.chunks.chunk-config'
local util = require 'main.modules.util'

----------------------------------------------------------------------
-- PROPERTIES
----------------------------------------------------------------------

local fractal = {}


local height_max = 16
local height_min = 1
local amplitude_max = height_max / 2 -- +4
local frequency_max = 0.005
local octaves = 3
local lacunarity = 2
local persistence = 0.5

----------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------

function fractal.noise_chunk(seed, chunk_x, chunk_y, a_mod, frq, oct)
	math.randomseed(seed)
	local grid = util.get_table(CC.width, CC.height, 0)
	local offset_x = math.random(-999999, 999999)
	local offset_y = math.random(-999999, 999999)

	local x = 1
	local y = 1

	for i = chunk_y * CC.height - (CC.height - 1), chunk_y * CC.height do
		for j = chunk_x * CC.width - (CC.width -1), chunk_x * CC.width do
			local noise = height_max / 2
			local frequency = frq or frequency_max
			local amplitude = amplitude_max + (a_mod or 0)
			for k = 1, oct or octaves do
				local sample_x = j * frequency + offset_x
				local sample_y = i * frequency + offset_y
				noise = noise + simplex.Noise2D(sample_x, sample_y) * amplitude
				frequency = frequency * lacunarity
				amplitude = amplitude * persistence
			end
			noise = util.clamp(height_min, height_max, util.round(noise))
			grid[y][x] = noise
			y = y + 1
		end
		y = 1
		x = x + 1
	end
	return grid
end

return fractal