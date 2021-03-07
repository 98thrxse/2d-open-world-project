function interface_menu(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

    end function

    object.onDrawEnd = function(canvas)

        ' getFont
        menu_font = m.game.getFont("VT323-36")
        
        DrawText(canvas, "<", canvas.GetWidth() / 2 - 100, 25, menu_font, "center", &hFF0000FF)
        DrawText(canvas, "*", canvas.GetWidth() / 2, 25, menu_font, "center", &hFF0000FF)
        DrawText(canvas, ">", canvas.GetWidth() / 2 + 100, 25, menu_font, "center", &hFF0000FF)

    end function

end function