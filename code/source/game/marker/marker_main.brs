function marker_main(object)
    
	object.onCreate = function(args)

        m.game.marker = marker_data()

        ' createInstance
        m.game.createInstance("marker_transition")
        m.game.createInstance("marker_control")

    end function

    object.onDestroy = function()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("marker_transition"))
        m.game.destroyInstance(m.game.getInstanceByName("marker_control"))
    end function
    
end function