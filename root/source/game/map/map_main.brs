sub map_main(object)
    
	object.onCreate = sub(args as object)

		m.game.map = map_data()

        ' createInstance
        m.game.createInstance("map_control")

    end sub

    object.onDestroy = sub()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("map_control"))
    end sub
    
end sub