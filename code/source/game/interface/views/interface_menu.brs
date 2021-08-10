function interface_menu(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

        ' getFont
        m.menu_font = m.game.getFont("VT323-36")
    end function

    object.onDrawEnd = function(canvas)

        if m.game.getFocusGroup() = "interface"
            if m.game.interface.config.menu.Count() <> 0
                for i = 0 to m.game.interface.config.menu.Count() - 1
                    if m.game.getFocusTarget() = i
                        DrawText(canvas, "<", canvas.GetWidth() / 2 - 100 + 3, 25 + 3, m.menu_font, "center", &h000000FF)
                        DrawText(canvas, m.game.interface.getMenuItemName(i).ToStr(), canvas.GetWidth() / 2 + 3, 25 + 3, m.menu_font, "center", &h000000FF)
                        DrawText(canvas, ">", canvas.GetWidth() / 2 + 100 + 3, 25 + 3, m.menu_font, "center", &h000000FF)

                        DrawText(canvas, "<", canvas.GetWidth() / 2 - 100, 25, m.menu_font, "center", &hFFFFFFFF)
                        DrawText(canvas, m.game.interface.getMenuItemName(i).ToStr(), canvas.GetWidth() / 2, 25, m.menu_font, "center", &hFFFFFFFF)
                        DrawText(canvas, ">", canvas.GetWidth() / 2 + 100, 25, m.menu_font, "center", &hFFFFFFFF)
                    end if
                end for
            end if
        end if

    end function

end function