function interface_sp(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

        ' getFont
        m.sp_font = m.game.getFont("VT323-36")
    end function

    object.onDrawEnd = function(canvas)

        DrawText(canvas, m.game.char.getSP().toStr() + "%", canvas.GetWidth() / 2 + 100, canvas.GetWidth() / 2, m.sp_font, "center", &h55ff00FF)

    end function

end function