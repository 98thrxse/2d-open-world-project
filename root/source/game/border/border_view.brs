sub border_view(object)

    object.funcName = "border_view"

    object.genCol = sub()

        if m.game.border.config.Count() <> 0
            ' load & add
            for i = 0 to m.game.border.config.Count() - 1
                if - m.game.map.getOffsetX() <= m.game.border.getColX(i) + m.game.border.getColW(i) and - m.game.map.getOffsetX() + m.game.screen.GetWidth() >= m.game.border.getColX(i) and - m.game.map.getOffsetY() <= m.game.border.getColY(i) + m.game.border.getColH(i) and - m.game.map.getOffsetY() + m.game.screen.GetHeight() >= m.game.border.getColY(i)
                    
                    if m.getCollider(m.game.border.getName(i).toStr() + "_" + i.toStr()) = invalid
                        ' addColliderRectangle
                        m.addColliderRectangle(m.game.border.getName(i).toStr() + "_" + i.toStr(), m.game.border.getColX(i), m.game.border.getColY(i), m.game.border.getColW(i), m.game.border.getColH(i))
                      
                    end if

                ' unload & remove
                else if m.getCollider(m.game.border.getName(i).toStr() + "_" + i.toStr()) <> invalid

                    m.removeCollider(m.game.border.getName(i).toStr() + "_" + i.toStr())

                end if
            
            end for
        end if
    end sub

    object.onCollision = sub(collider_name as string, other_collider_name as string, other_instance as object)

        if m.game.getFocusGroup() = "char"
            if other_collider_name = m.game.char.getColUpName()
                m.game.char.setColUp(true)

            else if other_collider_name = m.game.char.getColDownName()
                m.game.char.setColDown(true)

            else if other_collider_name = m.game.char.getColLeftName()
                m.game.char.setColLeft(true)

            else if other_collider_name = m.game.char.getColRightName()
                m.game.char.setColRight(true)
            end if
            
        else if m.game.getFocusGroup() = "veh"
            if other_collider_name = m.game.veh.getColUpName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
                m.game.veh.setColUp(m.game.char.getVeh().split("_").peek().toInt(), true)

            else if other_collider_name = m.game.veh.getColDownName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
                m.game.veh.setColDown(m.game.char.getVeh().split("_").peek().toInt(), true)

            else if other_collider_name = m.game.veh.getColLeftName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
                m.game.veh.setColLeft(m.game.char.getVeh().split("_").peek().toInt(), true)

            else if other_collider_name = m.game.veh.getColRightName(m.game.char.getVeh().split("_").peek().toInt()).toStr() + "_" + m.game.char.getVeh().split("_").peek().toInt().toStr()
                m.game.veh.setColRight(m.game.char.getVeh().split("_").peek().toInt(), true)
            end if
        end if

    end sub

    object.onUpdate = sub(dt as float)

        m.genCol()

    end sub

end sub