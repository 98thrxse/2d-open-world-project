function obj_control(object)

    object.onCreate = function(args)


    end function


    object.onButton = function(code as integer)

        ' released
        if code = 102
            if m.game.getFocusGroup() = "char"
                if m.game.char.getColDown() <> false then m.game.char.setColDown(false)
                if m.game.char.getColLeft() <> false then m.game.char.setColLeft(false)
                if m.game.char.getColRight() <> false then m.game.char.setColRight(false)

            end if

        else if code = 103
            if m.game.getFocusGroup() = "char"
                if m.game.char.getColUp() <> false then m.game.char.setColUp(false)
                if m.game.char.getColLeft() <> false then m.game.char.setColLeft(false)
                if m.game.char.getColRight() <> false then m.game.char.setColRight(false)

            end if

        else if code = 104
            if m.game.getFocusGroup() = "char"
                if m.game.char.getColUp() <> false then m.game.char.setColUp(false)
                if m.game.char.getColDown() <> false then m.game.char.setColDown(false)
                if m.game.char.getColRight() <> false then m.game.char.setColRight(false)

            end if

        else if code = 105
            if m.game.getFocusGroup() = "char"
                if m.game.char.getColUp() <> false then m.game.char.setColUp(false)
                if m.game.char.getColDown() <> false then m.game.char.setColDown(false)
                if m.game.char.getColLeft() <> false then m.game.char.setColLeft(false)

            end if

        end if

    end function

end function