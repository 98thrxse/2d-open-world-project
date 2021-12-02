function veh_init(object)

	object.onCreate = function(args)

		' defineObject
		m.game.defineObject("veh_main", veh_main)
		m.game.defineObject("veh_view", veh_view)
		m.game.defineObject("veh_control", veh_control)

		' createInstance
        m.game.createInstance("veh_main")

	end function

	object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("veh_main"))
    end function

end function