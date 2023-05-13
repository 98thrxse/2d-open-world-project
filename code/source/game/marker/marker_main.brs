sub marker_main(object)
    
	object.onCreate = sub(args as object)

        m.game.marker = marker_data()

        ' createInstance
        m.game.createInstance("marker_transition")
        m.game.createInstance("marker_control")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("marker_transition"))
        m.game.destroyInstance(m.game.getInstanceByName("marker_control"))
    end sub
    
end sub