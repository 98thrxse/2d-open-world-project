function interface_hp(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

        ' getFont
        m.hp_font = m.game.getFont("VT323-36")

    end function

    object.onDrawEnd = function(canvas)

        DrawText(canvas, m.game.char.getHP().toStr() + "%", canvas.GetWidth() / 2 + 3, canvas.GetWidth() / 2 + 3, m.hp_font, "center", &h000000FF)
        DrawText(canvas, m.game.char.getHP().toStr() + "%", canvas.GetWidth() / 2, canvas.GetWidth() / 2, m.hp_font, "center", &hFF0000FF)

    end function

end function