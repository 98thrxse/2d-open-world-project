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
        m.intersectChar()
        m.intersectVeh()
        m.updateView()

    end function

    object.intersectChar = function()
        if m.game.getFocusGroup() = "char"
            for i = 0 to m.game.obj.config.Count() - 1
                if m.game.char.getEntityX() < m.game.obj.getEntityX(i) + m.game.obj.getEntityW(i) and m.game.char.getEntityX() > m.game.obj.getEntityX(i) and m.game.char.getEntityY() + m.game.char.getSizeH() / 2 < m.game.obj.getEntityY(i) + m.game.obj.getEntityH(i) and m.game.char.getEntityY() + m.game.char.getSizeH() / 2 > m.game.obj.getEntityY(i)
                    if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                    if m.game.char.getAlpha() <> 125 then m.game.char.setAlpha(125)
                else
                    if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                    if m.game.char.getAlpha() <> 255 then m.game.char.setAlpha(255)
                end if
            end for
        end if
    end function

    object.intersectVeh = function()
        for i = 0 to m.game.obj.config.Count() - 1
            for j = 0 to m.game.veh.config.Count() - 1
                if m.game.getFocusGroup() = "veh" and m.game.char.getVeh().split("_").peek().toInt() = j
                    if m.game.veh.getScaleX(j) > 0.0
                        if m.game.veh.getEntityX(j) < m.game.obj.getEntityX(i) + m.game.obj.getEntityW(i) and m.game.veh.getEntityX(j) + m.game.veh.getEntityW(i) > m.game.obj.getEntityX(i)
                            if m.game.veh.getEntityY(j) + m.game.veh.getEntityH(j) / 2 < m.game.obj.getEntityY(i) + m.game.obj.getEntityH(i) and m.game.veh.getEntityY(j) + m.game.veh.getEntityH(j) > m.game.obj.getEntityY(i)
                                if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                                if m.game.veh.getAlpha(j) <> 125 then m.game.veh.setAlpha(j, 125)
                            else
                                if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                                if m.game.veh.getAlpha(j) <> 255 then m.game.veh.setAlpha(j, 255)
                            end if
                        else
                            if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                            if m.game.veh.getAlpha(j) <> 255 then m.game.veh.setAlpha(j, 255)
                        end if
                    else
                        if m.game.veh.getEntityX(j) - m.game.veh.getEntityW(i) < m.game.obj.getEntityX(i) + m.game.obj.getEntityW(i) and m.game.veh.getEntityX(j) > m.game.obj.getEntityX(i)
                            if m.game.veh.getEntityY(j) + m.game.veh.getEntityH(j) / 2 < m.game.obj.getEntityY(i) + m.game.obj.getEntityH(i) and m.game.veh.getEntityY(j) + m.game.veh.getEntityH(j) > m.game.obj.getEntityY(i)
                                if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                                if m.game.veh.getAlpha(j) <> 125 then m.game.veh.setAlpha(j, 125)
                            else
                                if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                                if m.game.veh.getAlpha(j) <> 255 then m.game.veh.setAlpha(j, 255)
                            end if
                        else
                            if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                            if m.game.veh.getAlpha(j) <> 255 then m.game.veh.setAlpha(j, 255)
                        end if
                    end if
                end if
            end for
        end for
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