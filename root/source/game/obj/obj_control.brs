sub obj_control(object)

    object.onCreate = sub(args as object)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("obj_view")

    end sub

    object.updatePos = sub()

        ' entity position
        m.view_wnd.x = m.game.map.getOffsetX()
        m.view_wnd.y = m.game.map.getOffsetY()

    end sub

    object.onUpdate = sub(dt as float)

        m.updatePos()
        m.updateView()

    end sub

    object.updateView = sub()

        for i = 0 to m.game.obj.config.Count() - 1
            if m.view_wnd.getImage(m.game.obj.getName(i).toStr() + "_" + i.toStr()) <> invalid
                
                ' update obj data
                m.view_wnd.getImage(m.game.obj.getName(i).toStr() + "_" + i.toStr()).alpha = m.game.obj.getAlpha(i)

            end if
        
        end for
    end sub

end sub