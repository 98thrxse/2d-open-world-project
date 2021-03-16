sub Main()

	game = new_game(1280, 720, true) ' This initializes the game engine
	
	initHelpers(game)

	' defineRoom
	game.defineRoom("game_init", game_init)
	
	' changeRoom
	game.changeRoom("game_init")


	game.Play()

end sub