function hud_data() as object

    hud = {

        ' item
        getMenuItemName: hud_getMenuItemName
        setMenuItemName: hud_setMenuItemName

        config: invalid

    }

    if hud.config = invalid

        hud.config = {
            menu: [
            ]
        }

    end if

    return hud

end function


function hud_getMenuItemName(i as object) as object
    return m.config.menu[i].name
end function

sub hud_setMenuItemName(i as object, name as object)
    m.config.menu[i].name = name
end sub