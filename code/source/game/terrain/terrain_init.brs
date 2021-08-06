function terrain_init(object)

	object.onCreate = function(args)

        ' defineObject
        m.game.defineObject("terrain_main", terrain_main)
        m.game.defineObject("terrain_view", terrain_view)
        m.game.defineObject("terrain_control", terrain_control)

        ' createInstance
        m.game.createInstance("terrain_main")
    
    end function

    object.onDestroy = function()
        m.game.destroyInstance(m.game.getInstanceByName("terrain_main"))
    end function

end function