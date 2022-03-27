function obj_control(object)

    object.onCreate = function(args)

        ' getInstanceByName
        m.view_wnd = m.game.getInstanceByName("obj_view")

    end function

    object.controlPos = function()

        ' entity position
        m.view_wnd.x = m.game.map.getOffsetX()
        m.view_wnd.y = m.game.map.getOffsetY()

    end function

    object.onUpdate = function(dt as float)

        m.controlPos()
        m.objIntersect()
        m.controlUpdate()

    end function


    object.objIntersect = function()

        if m.game.getFocusGroup() = "char"
            m.game.char.setObjIntersect(invalid)

            for i = 0 to m.game.obj.config.Count() - 1
                if m.game.char.getEntityX() < m.game.obj.getEntityX(i) + m.game.obj.getEntityW(i) and m.game.char.getEntityX() > m.game.obj.getEntityX(i) and m.game.char.getEntityY() + m.game.char.getSizeH() / 2 < m.game.obj.getEntityY(i) + m.game.obj.getEntityH(i) and m.game.char.getEntityY() + m.game.char.getSizeH() / 2 > m.game.obj.getEntityY(i)
                    if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                    m.game.char.setObjIntersect(i)
                else
                    if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                end if
            end for

            if m.game.char.getObjIntersect() = invalid
                if m.game.char.getAlpha() <> 255 then m.game.char.setAlpha(255)
            else
                if m.game.char.getAlpha() <> 125 then m.game.char.setAlpha(125)
            end if
        else if m.game.getFocusGroup() = "veh"
            m.game.veh.setObjIntersect(m.game.char.getVeh().split("_").peek().toInt(), invalid)

            for i = 0 to m.game.obj.config.Count() - 1
                if m.game.veh.getScaleX(m.game.char.getVeh().split("_").peek().toInt()) > 0.0
                    if m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) < m.game.obj.getEntityX(i) + m.game.obj.getEntityW(i) and m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityW(i) > m.game.obj.getEntityX(i)
                        if m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityH(m.game.char.getVeh().split("_").peek().toInt()) / 2 < m.game.obj.getEntityY(i) + m.game.obj.getEntityH(i) and m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityH(m.game.char.getVeh().split("_").peek().toInt()) > m.game.obj.getEntityY(i)
                            if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                            m.game.veh.setObjIntersect(m.game.char.getVeh().split("_").peek().toInt(), i)
                        else
                            if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                        end if
                    else
                        if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                    end if
                else
                    if m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) - m.game.veh.getEntityW(i) < m.game.obj.getEntityX(i) + m.game.obj.getEntityW(i) and m.game.veh.getEntityX(m.game.char.getVeh().split("_").peek().toInt()) > m.game.obj.getEntityX(i)
                        if m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityH(m.game.char.getVeh().split("_").peek().toInt()) / 2 < m.game.obj.getEntityY(i) + m.game.obj.getEntityH(i) and m.game.veh.getEntityY(m.game.char.getVeh().split("_").peek().toInt()) + m.game.veh.getEntityH(m.game.char.getVeh().split("_").peek().toInt()) > m.game.obj.getEntityY(i)
                            if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                            m.game.veh.setObjIntersect(m.game.char.getVeh().split("_").peek().toInt(), i)
                        else
                            if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                        end if
                    else
                        if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                    end if
                end if
            end for

            if m.game.veh.getObjIntersect(m.game.char.getVeh().split("_").peek().toInt()) = invalid
                if m.game.veh.getAlpha(m.game.char.getVeh().split("_").peek().toInt()) <> 255 then m.game.veh.setAlpha(m.game.char.getVeh().split("_").peek().toInt(), 255)
            else
                if m.game.veh.getAlpha(m.game.char.getVeh().split("_").peek().toInt()) <> 125 then m.game.veh.setAlpha(m.game.char.getVeh().split("_").peek().toInt(), 125)
            end if
        end if

    end function

    object.controlUpdate = function()

        for i = 0 to m.game.obj.config.Count() - 1
            if m.view_wnd.getImage(m.game.obj.getName(i).toStr() + "_" + i.toStr()) <> invalid
                
                ' update obj data
                m.view_wnd.getImage(m.game.obj.getName(i).toStr() + "_" + i.toStr()).alpha = m.game.obj.getAlpha(i)

            end if
        
        end for
    end function

end function