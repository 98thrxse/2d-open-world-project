sub marker_init(object)
    
	object.onCreate = sub(args as object)

        ' defineObject
	    m.game.defineObject("marker_main", marker_main)
	    m.game.defineObject("marker_transition", marker_transition)
        m.game.defineObject("marker_control", marker_control)

        ' createInstance
        m.game.createInstance("marker_main")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("marker_main"))
    end sub
    
end sub