function interact_char_obj(object)

    object.onCreate = function(args)
        
    end function


    object.interactAlpha = function()

        ' fix stas
        m.obj_entity = invalid

        for i = 0 to m.game.obj.config.Count() - 1
            if m.game.char.getEntityPosX() < m.game.obj.getEntityPosX(i) + m.game.obj.getEntityW(i) and m.game.char.getEntityPosX() > m.game.obj.getEntityPosX(i) and m.game.char.getEntityPosY() + m.game.char.getEntityH() / 2 < m.game.obj.getEntityPosY(i) + m.game.obj.getEntityH(i) and m.game.char.getEntityPosY() + m.game.char.getEntityH() / 2 > m.game.obj.getEntityPosY(i)
                if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)
                m.obj_entity = i

            else
                if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)

            end if
        end for

        if m.obj_entity = invalid 
            if m.game.char.getAlpha() <> 255 then m.game.char.setAlpha(255)

        else
            if m.game.char.getAlpha() <> 125 then m.game.char.setAlpha(125)

        end if

    end function


    object.onUpdate = function(dt as float)

        m.interactAlpha()

    end function

end function