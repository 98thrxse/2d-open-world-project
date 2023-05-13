function obj_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("obj_view")

    end function

    object.updatePos = function()

        ' entity position
        m.view_wnd.x = m.game.map.getOffsetX()
        m.view_wnd.y = m.game.map.getOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.updatePos()
        m.updateView()

    end function

    object.updateView = function()

        for i = 0 to m.game.obj.config.Count() - 1
            if m.view_wnd.getImage(m.game.obj.getName(i).toStr() + "_" + i.toStr()) <> invalid
                
                ' update obj data
                m.view_wnd.getImage(m.game.obj.getName(i).toStr() + "_" + i.toStr()).alpha = m.game.obj.getAlpha(i)

            end if
        
        end for
    end function

end function