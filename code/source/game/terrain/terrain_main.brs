function terrain_main(object)

    object.onCreate = function(args)
        
        ' createInstance
        m.game.createInstance("terrain_entity")
        m.game.createInstance("terrain_control")

    end function
    
end function