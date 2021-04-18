function obj_control(object)

    object.onCreate = function(args)


    end function


    object.onButton = function(code as integer)

        ' released
        if code = 102
            if m.game.getFocusGroup() = "char"
                if m.game.char.getDownCol() <> false then m.game.char.setDownCol(false)
                if m.game.char.getLeftCol() <> false then m.game.char.setLeftCol(false)
                if m.game.char.getRightCol() <> false then m.game.char.setRightCol(false)

            end if

        else if code = 103
            if m.game.getFocusGroup() = "char"
                if m.game.char.getUpCol() <> false then m.game.char.setUpCol(false)
                if m.game.char.getLeftCol() <> false then m.game.char.setLeftCol(false)
                if m.game.char.getRightCol() <> false then m.game.char.setRightCol(false)

            end if

        else if code = 104
            if m.game.getFocusGroup() = "char"
                if m.game.char.getUpCol() <> false then m.game.char.setUpCol(false)
                if m.game.char.getDownCol() <> false then m.game.char.setDownCol(false)
                if m.game.char.getRightCol() <> false then m.game.char.setRightCol(false)

            end if

        else if code = 105
            if m.game.getFocusGroup() = "char"
                if m.game.char.getUpCol() <> false then m.game.char.setUpCol(false)
                if m.game.char.getDownCol() <> false then m.game.char.setDownCol(false)
                if m.game.char.getLeftCol() <> false then m.game.char.setLeftCol(false)

            end if

        end if

    end function

end function