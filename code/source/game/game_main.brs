function game_main(object)
    
	object.onCreate = function(args)

        ' set focus
        m.game.setFocusGroup("char")
        m.game.setFocusTarget("")

        ' createInstance        
        m.game.createInstance("locations_init")

    end function
    
end function