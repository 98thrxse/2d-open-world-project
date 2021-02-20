function action_char_obj(object)

    object.onCreate = function(args)
        
    end function


    object.objAlpha = function()

        for i = 0 to m.game.obj.config.Count() - 1
            if m.game.char.getPosX() = m.game.obj.getPosX(i)
                print "stas"
            end if

        end for

    end function

    object.onUpdate = function(dt as float)

        m.objAlpha()

    end function

end function