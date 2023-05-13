sub terrain_init(object)

	object.onCreate = sub(args as object)

        ' defineObject
        m.game.defineObject("terrain_main", terrain_main)
        m.game.defineObject("terrain_view", terrain_view)
        m.game.defineObject("terrain_control", terrain_control)

        ' createInstance
        m.game.createInstance("terrain_main")
    
    end sub

    object.onDestroy = sub()
        ' destroyInstance
        m.game.destroyInstance(m.game.getInstanceByName("terrain_main"))
    end sub

end sub