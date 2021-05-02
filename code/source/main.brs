sub Main()

	game = new_game(1280, 720, true) ' This initializes the game engine
	
	doFocus(game)

	' defineRoom
	game.defineRoom("game_init", game_init)
	
	' changeRoom
	game.changeRoom("game_init")


	game.Play()

end sub