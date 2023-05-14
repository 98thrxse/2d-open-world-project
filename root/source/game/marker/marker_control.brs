sub marker_control(object)

    object.onCreate = sub(args as object)

        ' getInstanceByName
        m.transition_view_wnd = m.game.getInstanceByName("marker_transition")

    end sub

    object.updatePos = sub()

        ' entity position
        m.transition_view_wnd.x = m.game.map.getOffsetX()
        m.transition_view_wnd.y = m.game.map.getOffsetY()

    end sub

    object.onUpdate = sub(dt as float)

        m.updatePos()
        m.updateView()

    end sub

    object.updateView = sub()

        for i = 0 to m.game.marker.config.Count() - 1
            if m.transition_view_wnd.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()) <> invalid
                
                ' update marker data
                m.transition_view_wnd.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()).alpha = m.game.marker.getAlpha(i)
                m.transition_view_wnd.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.marker.getOffsetX(i)
				m.transition_view_wnd.getImage(m.game.marker.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.marker.getOffsetY(i)

            end if
        
            if m.transition_view_wnd.getCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr()) <> invalid
                m.transition_view_wnd.getCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr()).offset_x = m.game.marker.getOffsetX(i)
                m.transition_view_wnd.getCollider(m.game.marker.getName(i).toStr() + "_" + i.toStr()).offset_y = m.game.marker.getOffsetY(i)
            end if
        end for
    end sub

end sub