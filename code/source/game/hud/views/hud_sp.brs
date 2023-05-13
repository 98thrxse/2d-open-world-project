sub hud_sp(object)

    object.onCreate = sub(args as object)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

        ' getFont
        m.sp_font = m.game.getFont("VT323-36")
    end sub

    object.onDrawEnd = sub(canvas as object)

        DrawText(canvas, m.game.char.getSP().toStr() + "%", canvas.GetWidth() / 2 + 50 + 3, canvas.GetWidth() / 2 + 3, m.sp_font, "center", &h000000FF)
        DrawText(canvas, m.game.char.getSP().toStr() + "%", canvas.GetWidth() / 2 + 50, canvas.GetWidth() / 2, m.sp_font, "center", &h55ff00FF)

    end sub

end sub