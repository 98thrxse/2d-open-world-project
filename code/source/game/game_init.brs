function game_init(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("game_main", game_main)
	    m.game.defineObject("locations_init", locations_init)

        ' createInstance
        m.game.createInstance("game_main")

    end function
    
end function