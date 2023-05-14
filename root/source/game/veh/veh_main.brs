sub veh_main(object)

    object.onCreate = sub(args as object)

		m.game.veh = veh_data()

		' createInstance
        m.game.createInstance("veh_view")
        m.game.createInstance("veh_control")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("veh_view"))
        m.game.destroyInstance(m.game.getInstanceByName("veh_control"))
    end sub
    
end sub