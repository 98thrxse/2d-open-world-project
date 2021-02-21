function action_char_obj(object)

    object.onCreate = function(args)
        
    end function


    object.objAlpha = function()

        for i = 0 to m.game.obj.config.Count() - 1
            if m.game.char.getPosX() < m.game.obj.getObjPosX(i) + m.game.obj.getObjW(i) and m.game.char.getPosX() > m.game.obj.getObjPosX(i)
                if m.game.char.getPosY() + m.game.char.getH() / 2 < m.game.obj.getObjPosY(i) + m.game.obj.getObjH(i) and m.game.char.getPosY() + m.game.char.getH() / 2 > m.game.obj.getObjPosY(i)
                    if m.game.obj.getAlpha(i) <> 125 then m.game.obj.setAlpha(i, 125)

                end if

            else
                if m.game.obj.getAlpha(i) <> 255 then m.game.obj.setAlpha(i, 255)
                
            end if

        end for

    end function


    object.onUpdate = function(dt as float)

        m.objAlpha()

    end function

end function