sub game_main(object)
    
	object.onCreate = sub(args as object)

        ' set focus
        m.game.setFocusGroup("char")
        m.game.setFocusTarget(0)

        ' createInstance        
        m.game.createInstance("map_init")

    end sub
    
end sub