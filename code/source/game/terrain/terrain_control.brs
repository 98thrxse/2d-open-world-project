sub terrain_control(object)

    object.onCreate = sub(args as object)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("terrain_view")

    end sub

    object.updatePos = sub()

        ' position
        m.view_wnd.x = m.game.map.getOffsetX()
        m.view_wnd.y = m.game.map.getOffsetY()

    end sub

    object.onUpdate = sub(dt as float)

        m.updatePos()

    end sub
    
end sub