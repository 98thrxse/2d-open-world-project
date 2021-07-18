function obj_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.entity_wnd = m.game.getInstanceByName("obj_entity")
        m.col_wnd = m.game.getInstanceByName("obj_col")

    end function

    object.controlXY = function()

        ' entity position
        m.entity_wnd.x = m.game.xy.getZeroOffsetX()
        m.entity_wnd.y = m.game.xy.getZeroOffsetY()

        ' col position
        m.col_wnd.x = m.game.xy.getZeroOffsetX()
        m.col_wnd.y = m.game.xy.getZeroOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlXY()

    end function

end function