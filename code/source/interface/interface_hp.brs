function interface_hp(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

    end function

    object.onDrawEnd = function(canvas)

        ' getFont
        hp_font = m.game.getFont("VT323-36")
        
        DrawText(canvas, "100", canvas.GetWidth() / 2, canvas.GetWidth() / 2, hp_font, "center", &hFFFFFFFF)

    end function

end function