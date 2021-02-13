sub Main()

	game = new_game(1280, 720, true) ' This initializes the game engine

	' defineRoom
	game.defineRoom("locations_init", locations_init)
	
	' changeRoom
	game.changeRoom("locations_init")

	game.Play()

end sub