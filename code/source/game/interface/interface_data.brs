function interface_data() as object

    m.interface = {

        ' item
        getMenuItemName: interface_getMenuItemName
        setMenuItemName: interface_setMenuItemName

        config: invalid

    }

    if m.interface.config = invalid

        m.interface.config = {
            menu: [
            ]
        }

    end if

    return m.interface

end function


function interface_getMenuItemName(i as object) as object
    return m.config.menu[i].name
end function

sub interface_setMenuItemName(i as object, name as object)
    m.config.menu[i].name = name
end sub