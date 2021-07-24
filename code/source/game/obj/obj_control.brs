function obj_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.entity_wnd = m.game.getInstanceByName("obj_entity")
        m.col_wnd = m.game.getInstanceByName("obj_col")

    end function

    object.controlPos = function()

        ' entity position
        m.entity_wnd.x = m.game.map.getEntityOffsetX()
        m.entity_wnd.y = m.game.map.getEntityOffsetY()

        ' col position
        m.col_wnd.x = m.game.map.getEntityOffsetX()
        m.col_wnd.y = m.game.map.getEntityOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlPos()

    end function

end function