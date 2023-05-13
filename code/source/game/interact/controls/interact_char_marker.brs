sub interact_char_marker(object)

    object.onButton = sub(code as integer)

        ' pressed
        if code = 13 ' play
            if m.game.getFocusGroup() = "char"
              m.transition()
            end if
        end if

    end sub

    object.transition = sub()

        if m.game.char.getMarkerCol() <> invalid and m.game.char.getVehCol() = invalid

            ' set char pos
            m.game.char.setEntityX(m.game.marker.getTransitionX(m.game.char.getMarkerCol().split("_").peek().toInt()))
            m.game.char.setEntityY(m.game.marker.getTransitionY(m.game.char.getMarkerCol().split("_").peek().toInt()))

            ' set char map
            m.game.char.setMap(m.game.marker.getMap(m.game.char.getMarkerCol().split("_").peek().toInt()))

        end if
    
    end sub

end sub