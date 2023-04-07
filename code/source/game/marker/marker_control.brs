function marker_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.transition_view_wnd = m.game.getInstanceByName("marker_transition")

    end function

    object.controlPos = function()

        ' entity position
        m.transition_view_wnd.x = m.game.map.getOffsetX()
        m.transition_view_wnd.y = m.game.map.getOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlPos()
        m.controlUpdate()

    end function

    object.onButton = function(code as integer)

        ' pressed
        if code = 13 ' play
            if m.game.getFocusGroup() = "char"
              m.markerTransition()
            end if
        end if

    end function

    object.markerTransition = function()

        if m.game.char.getMarkerCol() <> invalid and m.game.char.getVehCol() = invalid

            m.game.destroyInstance(m.game.getInstanceByName("map_control"))

            ' set char map
            m.game.char.setMap(m.game.marker.getMap(m.game.char.getMarkerCol().split("_").peek().toInt()))

            ' set char pos
            m.game.char.setEntityX(m.game.marker.getTransitionX(m.game.char.getMarkerCol().split("_").peek().toInt()))
            m.game.char.setEntityY(m.game.marker.getTransitionY(m.game.char.getMarkerCol().split("_").peek().toInt()))

            m.game.createInstance("map_control")
        end if
    
    end function

    object.controlUpdate = function()

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
    end function

end function