function marker_init(object)
    
	object.onCreate = function(args)

        ' defineObject
	    m.game.defineObject("marker_main", marker_main)
	    m.game.defineObject("marker_transition", marker_transition)
        m.game.defineObject("marker_control", marker_control)

        ' createInstance
        m.game.createInstance("marker_main")

    end function

    object.onDestroy = function()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("marker_main"))
    end function
    
end function