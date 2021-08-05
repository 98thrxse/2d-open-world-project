function marker_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.transition_view_wnd = m.game.getInstanceByName("marker_transition")

    end function

    object.controlPos = function()

        ' entity position
        m.transition_view_wnd.x = m.game.map.getEntityOffsetX()
        m.transition_view_wnd.y = m.game.map.getEntityOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlPos()
        m.animUpdate()

    end function

    object.animUpdate = function()

        for i = 0 to m.game.marker.config.Count() - 1
            if m.transition_view_wnd.getImage(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr()) <> invalid
                
                ' update marker data
                m.transition_view_wnd.getImage(m.game.marker.getEntityName(i).toStr() + "_" + i.toStr()).alpha = m.game.marker.getAlpha(i)

            end if
        
        end for
    end function

end function