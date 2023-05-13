sub terrain_main(object)

    object.onCreate = sub(args as object)

		m.game.terrain = terrain_data()
        
        ' createInstance
        m.game.createInstance("terrain_view")
        m.game.createInstance("terrain_control")

    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("terrain_view"))
        m.game.destroyInstance(m.game.getInstanceByName("terrain_control"))
    end sub
    
end sub