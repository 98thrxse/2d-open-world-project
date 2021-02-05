function interface_sp(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

    end function

    object.onDrawEnd = function(canvas)

        ' getFont
        sp_font = m.game.getFont("VT323-36")
        
        DrawText(canvas, char_getSP().toStr(), canvas.GetWidth() / 2 + 100, canvas.GetWidth() / 2, sp_font, "center", &h55ff00FF)

    end function

end function