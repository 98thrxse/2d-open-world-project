function interface_menu(object)

    object.onCreate = function(args)

        ' loadFont
        m.game.loadFont("VT323-36", "VT323", 36, false, false)

    end function

    object.onDrawEnd = function(canvas)

        ' getFont
        menu_font = m.game.getFont("VT323-36")
        if m.game.getFocusGroup() = "interface"
            for i = 0 to m.game.interface.config.focus.menu.Count() - 1
                if m.game.getFocusTarget() = i
                    DrawText(canvas, "<", canvas.GetWidth() / 2 - 100, 25, menu_font, "center", &hFFFFFFFF)
                    DrawText(canvas, m.game.interface.getMenuItemName(i).ToStr(), canvas.GetWidth() / 2, 25, menu_font, "center", &hFFFFFFFF)
                    DrawText(canvas, ">", canvas.GetWidth() / 2 + 100, 25, menu_font, "center", &hFFFFFFFF)
                end if
            end for

        end if

    end function

end function