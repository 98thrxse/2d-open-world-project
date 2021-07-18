function game_main(object)
    
	object.onCreate = function(args)

        ' set focus
        m.game.setFocusGroup("char")
        m.game.setFocusTarget("")

        ' createInstance        
        m.game.createInstance("map_init")

    end function
    
end function