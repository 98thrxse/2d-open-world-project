sub interact_char_obj(object)

    object.onUpdate = sub(dt as float)

        m.intersect()

    end sub

    object.intersect = sub()
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
    end sub

end sub