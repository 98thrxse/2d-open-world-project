sub interact_obj_veh(object)

    object.onUpdate = sub(dt as float)

        m.intersect()

    end sub

    object.intersect = sub()
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
    end sub

end sub