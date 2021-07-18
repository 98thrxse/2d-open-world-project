function terrain_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.entity_wnd = m.game.getInstanceByName("terrain_entity")

    end function

    object.controlXY = function()

        ' position
        m.entity_wnd.x = m.game.xy.getZeroOffsetX()
        m.entity_wnd.y = m.game.xy.getZeroOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlXY()

    end function
    
end function