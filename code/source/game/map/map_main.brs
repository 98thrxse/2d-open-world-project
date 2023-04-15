function map_main(object)
    
	object.onCreate = function(args)

		m.game.map = map_data()

        ' createInstance
        m.game.createInstance("map_control")

    end function

    object.onDestroy = function()
		' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("map_control"))
    end function
    
end function