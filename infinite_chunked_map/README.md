# EXAMPLE: Procedural map generation with chunks

This is a small, complete project. The code is probably not optimized on some ends and definitely not perfect, so feel free to optimize it and let me know :D

I used some code written by others and modified it in some cases to accomplish the needed results. 
You can find links to the original content in the credits at the bottom of this readme.


## SCHORT DOCUMENTATION:

The main folder contains the [main collection](defold://open?path=/main/main.collection) and 4 sub directories:
	- cam
	- map
	- modules
	- player

### CAM:
The cam directory contains the [camera script](defold://open?path=/main/cam/camera.script). This script controlls the main camera, wich by default follows the player. With the UP and DOWN keys you can zoom in and out.

### MAP:
The map directory contains the [tilesource](defold://open?path=/main/map/tilesource.script) and a subdirectory for the chunks. The chunk-subdirectory contains 25 tilemaps wich represent our chunks, a chunk config module, the chunk-controller script, the fractal noise module and the [simplex noise](defold://open?path=/main/map/chunks/simplex.lua) module.

Each of the chunks consists of 16x16 tiles (the size can be adjusted to your likings, but some code needs adjustments too afterwards).
The [chunk-config](defold://open?path=/main/map/chunks/chunk-config.lua) module contains some basic information like size of the chunks, the tilesize in px, the current seed (so it can be used in all chunks) and some other information.

The [chunk-controller](defold://open?path=/main/map/chunks/chunk-controller.script) script uses the chunk-config and the fractal noise module to generate a noise wich then is translated into the specific tile-IDs. The specific tiles representing the environment/world are then set on the tilemap/chunk. Furthermore the controller contains code (update-function) wich moves the map/chunks instead of the player, creating the illusion of the player moving around the world (given, the camera is not zoomed too far away). Finally the script also contains code (in on_input-function) used for creating a new seed, saving it in the chunk-config module and reloading the chunks. This can be done by pressing 'R'.

The [fractal noise](defold://open?path=/main/map/chunks/fractal.lua) module consists of some local variables needed for the noise function and the noise function itself. The function has multiple parameter:

	- seed:		the map seed located in the chunk-config module

	- chunk_x:	the x-coordinate of the chunk related to the current chunk (-2 to 2)

	- chunk_y:	the y-coordinate of the chunk related to the current chunk (-2 to 2)

	- a_mod:	[optional] a modification to the standard value of the amplitude (amplitude_max); is added to the default of 'height_max/2'

	- frq: 		[optional] an alternative frequency value, if you need a different than the hard coded one

	- oct:		[optional] an alternative octave value, if you need a different than the hard coded one

This function creates a table and fills it with noise-values by using and enhancing the simplex noise (explained very good in this [video](https://www.youtube.com/watch?v=Z6m7tFztEvw&t=594s) made by Klayton Kowalski).

The [simplex noise](defold://open?path=/main/map/chunks/simplex.lua) module can be used to generate 2D, 3D and 4D Simplex noise

### MODULES:
This directory contains a lua module named 'util'. It contains some usefull functions. The one used in this project was get_table() used in the fractal noise generation.

### PLAYER:
This subdirectory contains files related to the player like: player atlas, the game object and the player script enableing the player to 'move'.

## CREDITS:

camera.lua - unfortunately I am not sure where I got the code from. If it is yours, let me know and I will add a link here to the credits.

simplex.lua - taken from here: [GitHub](https://github.com/weswigham/simplex)

util.lua - slightly extended/modified version of Klayton Kowalskis code from his [fractal noise example](https://github.com/klaytonkowalski/example-fractal-noise)

fractal.lua - modified version of Klayton Kowalskis code from his [fractal noise example](https://github.com/klaytonkowalski/example-fractal-noise)

player.script - slightly adapted version of britzls player.script from [infinite_map example](https://github.com/britzl/publicexamples/tree/master/examples/infinite_map)

chunk_controller.script - adapted version of britzls infinite_map.script from [infinite_map example](https://github.com/britzl/publicexamples/tree/master/examples/infinite_map)

sprites in assets folder - took them from [itch.io](https://merchant-shade.itch.io/16x16-mini-world-sprites)

