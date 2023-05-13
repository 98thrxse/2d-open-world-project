sub Main()

	game = new_game(1280, 720, true) ' This initializes the game engine (only 1280 x 720 is currently supported)
	game.ver = "1.0.0"

	global_focus(game)

	' defineRoom
	game.defineRoom("game_init", game_init)
	
	' changeRoom
	game.changeRoom("game_init")


	game.Play()

end sub