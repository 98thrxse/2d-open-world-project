function terrain_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("terrain_view")

    end function

    object.controlPos = function()

        ' position
        m.view_wnd.x = m.game.map.getEntityOffsetX()
        m.view_wnd.y = m.game.map.getEntityOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlPos()

    end function
    
end function