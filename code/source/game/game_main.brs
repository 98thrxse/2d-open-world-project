function game_main(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("locations_init", locations_init)

        ' createInstance        
        m.game.createInstance("locations_init")

    end function
    
end function