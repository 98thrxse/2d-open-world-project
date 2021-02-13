sub Main()

	game = new_game(1280, 720, true) ' This initializes the game engine
	m.game = game
	
    m.game.user = char_data() ' fix stas

	' defineRoom
	game.defineRoom("locations_init", locations_init)
	
	' changeRoom
	game.changeRoom("locations_init")

	game.Play()

end sub