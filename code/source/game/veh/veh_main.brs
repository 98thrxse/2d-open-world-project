function veh_main(object)

    object.onCreate = function(args)

		m.game.veh = veh_data()

		' createInstance
        m.game.createInstance("veh_view")
        m.game.createInstance("veh_control")

    end function

    object.onDestroy = function()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("veh_view"))
        m.game.destroyInstance(m.game.getInstanceByName("veh_control"))
    end function
    
end function